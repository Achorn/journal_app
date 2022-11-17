import 'package:flutter/material.dart';
import 'package:journal_app/entry_list/view_models/entries_view_model.dart';
import 'package:journal_app/entry_list/views/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => EntriesViewModel())],
      child: MaterialApp(
        title: 'Journal App',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: const MyHomePage(title: 'Journal Home Page'),
      ),
    );
  }
}
