import 'package:flutter/material.dart';
import 'package:journal_app/entry_list/models/entry_model.dart';

class EntryListRow extends StatelessWidget {
  final EntryModel entryModel;
  final VoidCallback onTap;
  const EntryListRow({required this.entryModel, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              entryModel.title,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              entryModel.content,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
