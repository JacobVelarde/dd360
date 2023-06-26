
import 'dart:convert';

import 'package:test_dd360/src/model/data_stories.dart';

StoriesResponse storiesResponseFromJson(String str) => StoriesResponse.fromJson(json.decode(str));

String storiesResponseToJson(StoriesResponse data) => json.encode(data.toJson());

class StoriesResponse {
  int? code;
  String? status;
  String? copyright;
  String? attributionText;
  String? attributionHtml;
  String? etag;
  DataStories? data;

  StoriesResponse({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.etag,
    this.data,
  });

  factory StoriesResponse.fromJson(Map<String, dynamic> json) => StoriesResponse(
    code: json["code"],
    status: json["status"],
    copyright: json["copyright"],
    attributionText: json["attributionText"],
    attributionHtml: json["attributionHTML"],
    etag: json["etag"],
    data: json["data"] == null ? null : DataStories.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "copyright": copyright,
    "attributionText": attributionText,
    "attributionHTML": attributionHtml,
    "etag": etag,
    "data": data?.toJson(),
  };
}