import 'package:flutter/material.dart';
import 'package:journal_app/entry_list/models/entry_model.dart';
import 'package:journal_app/entry_list/view_models/entries_view_model.dart';
import 'package:provider/provider.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EntriesViewModel entriesViewModel = context.watch<EntriesViewModel>();
    EntryModel entry = entriesViewModel.selectedEntry;
    return Scaffold(
      appBar: AppBar(
        title: Text(entry.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: TextFormField(
          initialValue: entry.content,
          autofocus: true,
          maxLines: 200,
          keyboardType: TextInputType.multiline,
          onChanged: (value) => {
            entry.content = value,
            entriesViewModel.updateSelectedEntry(entry),
          },
        ),
      ),
    );
  }
}
