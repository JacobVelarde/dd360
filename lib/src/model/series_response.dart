
import 'dart:convert';

import 'package:test_dd360/src/model/data_series.dart';

SeriesResponse seriesResponseFromJson(String str) => SeriesResponse.fromJson(json.decode(str));

String seriesResponseToJson(SeriesResponse data) => json.encode(data.toJson());

class SeriesResponse {
  int? code;
  String? status;
  String? copyright;
  String? attributionText;
  String? attributionHtml;
  String? etag;
  DataSeries? data;

  SeriesResponse({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.etag,
    this.data,
  });

  factory SeriesResponse.fromJson(Map<String, dynamic> json) => SeriesResponse(
    code: json["code"],
    status: json["status"],
    copyright: json["copyright"],
    attributionText: json["attributionText"],
    attributionHtml: json["attributionHTML"],
    etag: json["etag"],
    data: json["data"] == null ? null : DataSeries.fromJson(json["data"]),
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