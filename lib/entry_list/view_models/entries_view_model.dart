import 'package:flutter/material.dart';
import 'package:journal_app/entry_list/models/entry_model.dart';
import 'package:uuid/uuid.dart';

class EntriesViewModel extends ChangeNotifier {
  List<EntryModel> _entryListModel = [];
  late EntryModel _selectedEntry;

  List<EntryModel> get entryListModel => _entryListModel;
  EntryModel get selectedEntry => _selectedEntry;

  setEntryListModel(List<EntryModel> entryListModel) {
    _entryListModel = entryListModel;
  }

  setSelectedEntry(EntryModel entryModel) {
    _selectedEntry = entryModel;
  }

  EntryModel addNewEntry() {
    EntryModel newEntry = EntryModel(
        id: const Uuid().v4(), title: 'New Entry', content: 'Today I...');
    _entryListModel.add(newEntry);
    notifyListeners();
    return newEntry;
  }

  Future<String> getEntries() async {
    await Future.delayed(const Duration(seconds: 3));
    _entryListModel = defaultEntryList;
    return Future.value("success");
  }

  updateSelectedEntry(EntryModel updatedEntry) {
    final index =
        _entryListModel.indexWhere((element) => element.id == updatedEntry.id);
    _entryListModel[index] = updatedEntry;
    notifyListeners();
  }
}

//TODO: add a service to fetch these
EntryModel entry1 = EntryModel(
    id: const Uuid().v4(),
    title: 'Entry One',
    content: 'As I sit here typing, I think to myself blah blah blah');

EntryModel entry2 = EntryModel(
    id: const Uuid().v4(),
    title: 'Entry Two',
    content:
        'As I sit here typing, I think to myself blah blah blah As I sit here typing, I think to myself blah blah blah');

List<EntryModel> defaultEntryList = [entry1, entry2];
