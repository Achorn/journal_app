import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  final String description;
  const AppLoading({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(description),
          ),
        ],
      ),
    );
  }
}
