

import 'package:test_dd360/src/model/data_comic.dart';

import 'dart:convert';

ComicsResponse comicsResponseFromJson(String str) => ComicsResponse.fromJson(json.decode(str));

String comicsResponseToJson(ComicsResponse data) => json.encode(data.toJson());

class ComicsResponse {
  int? code;
  String? status;
  String? copyright;
  String? attributionText;
  String? attributionHtml;
  String? etag;
  DataComic? data;

  ComicsResponse({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.etag,
    this.data,
  });

  factory ComicsResponse.fromJson(Map<String, dynamic> json) => ComicsResponse(
    code: json["code"],
    status: json["status"],
    copyright: json["copyright"],
    attributionText: json["attributionText"],
    attributionHtml: json["attributionHTML"],
    etag: json["etag"],
    data: json["data"] == null ? null : DataComic.fromJson(json["data"]),
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