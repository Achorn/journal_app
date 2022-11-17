import 'package:flutter/material.dart';
import 'package:journal_app/components/entry_list_row.dart';
import 'package:journal_app/entry_list/models/entry_model.dart';
import 'package:journal_app/entry_list/view_models/entries_view_model.dart';
import 'package:journal_app/utils/navigation_utils.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    EntriesViewModel entriesViewModel = context.watch<EntriesViewModel>();

    Widget pageWrapperDisplay() {
      return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(child: entriesLoader(entriesViewModel)),
          floatingActionButton: addEntryButton(entriesViewModel));
    }

    return pageWrapperDisplay();
  }

  Widget addEntryButton(entriesViewModel) {
    return FloatingActionButton(
      onPressed: () {
        EntryModel newEntry = entriesViewModel.addNewEntry();
        entriesViewModel.setSelectedEntry(newEntry);
        openEntry(context);
      },
      tooltip: 'New Entry',
      child: const Icon(Icons.add),
    );
  }

  Widget buildEntriesList(entriesViewModel) {
    return entriesViewModel.entryListModel.isEmpty
        ? const Text(
            'Create a new Entry to start typing',
          )
        : ListView.separated(
            itemBuilder: (context, index) {
              EntryModel entryModel = entriesViewModel.entryListModel[index];
              return EntryListRow(
                entryModel: entryModel,
                onTap: () async {
                  entriesViewModel.setSelectedEntry(entryModel);
                  openEntry(context);
                },
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: entriesViewModel.entryListModel.length);
  }

  Widget buildLoadingDisplay() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text('Getting Entries...'),
          ),
        ],
      ),
    );
  }

  Widget entriesLoader(entriesViewModel) {
    return FutureBuilder<String>(
      future: entriesViewModel.getEntries(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        Widget child;
        if (snapshot.hasData) {
          child = buildEntriesList(entriesViewModel);
        } else if (snapshot.hasError) {
          child = buildError(snapshot.error);
        } else {
          child = buildLoadingDisplay();
        }
        return Center(child: child);
      },
    );
  }

  Widget buildError(error) {
    return Column(
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 60,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text('Error: $error'),
        ),
      ],
    );
  }
}
