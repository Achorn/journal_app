// To parse this JSON data, do
//
//     final usersList = usersListFromJson(jsonString);

import 'dart:convert';

List<EntryModel> usersListFromJson(String str) =>
    List<EntryModel>.from(json.decode(str).map((x) => EntryModel.fromJson(x)));

String usersListToJson(List<EntryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EntryModel {
  EntryModel({
    required this.id,
    required this.title,
    required this.content,
  });

  String id;
  String title;
  String content;

  factory EntryModel.fromJson(Map<String, dynamic> json) => EntryModel(
        id: json['id'],
        title: json["title"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": title,
        "content": content,
      };
}
