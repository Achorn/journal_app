import 'package:flutter/material.dart';
import 'package:journal_app/entry_list/views/entry_screen.dart';

void openEntry(BuildContext context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => const EntryScreen()));
}
