// To parse this JSON data, do
//
//     final noteDataModel = noteDataModelFromJson(jsonString);

import 'dart:convert';

NoteDataModel noteDataModelFromJson(String str) => NoteDataModel.fromJson(json.decode(str));

String noteDataModelToJson(NoteDataModel data) => json.encode(data.toJson());

class NoteDataModel {
  String? title;
  String? content;
  String? date;

  NoteDataModel({
    this.title,
    this.content,
    this.date,
  });

  factory NoteDataModel.fromJson(Map<String, dynamic> json) => NoteDataModel(
        title: json["title"],
        content: json["content"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "date": date,
      };
}
