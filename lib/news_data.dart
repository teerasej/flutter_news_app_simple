// To parse this JSON data, do
//
//     final newsData = newsDataFromJson(jsonString);

import 'dart:convert';

class NewsData {
  NewsData({
    required this.id,
    required this.content,
  });

  String id;
  String content;

  factory NewsData.fromRawJson(String str) =>
      NewsData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
        id: json["_id"] == null ? null : json["_id"],
        content: json["content"] == null ? null : json["content"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "content": content == null ? null : content,
      };
}
