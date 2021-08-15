// To parse this JSON data, do
//
//     final newsData = newsDataFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<NewsData> newsDataFromJson(String str) =>
    List<NewsData>.from(json.decode(str).map((x) => NewsData.fromJson(x)));

String newsDataToJson(List<NewsData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsData {
  NewsData({
    required this.id,
    required this.content,
  });

  String id;
  String content;

  factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
        id: json["_id"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "content": content,
      };
}
