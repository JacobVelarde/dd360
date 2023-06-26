
import 'package:test_dd360/src/model/next.dart';
import 'package:test_dd360/src/model/original_issue.dart';
import 'package:test_dd360/src/model/series.dart';

class Characters {
  int? available;
  String? collectionUri;
  List<Series>? items;
  List<OriginalIssue>? originalIssues;
  List<Next>? itemsNext;
  int? returned;

  Characters({
    this.available,
    this.collectionUri,
    this.originalIssues,
    this.items,
    this.itemsNext,
    this.returned,
  });

  factory Characters.fromJson(Map<String, dynamic> json) => Characters(
    available: json["available"],
    collectionUri: json["collectionURI"],
    originalIssues: json["items"] == null ? [] : List<OriginalIssue>.from(json["items"].map((x) => OriginalIssue.fromJson(x))),
    items: json["items"] == null ? [] : List<Series>.from(json["items"].map((x) => Series.fromJson(x))),
    itemsNext: json["items"] == null ? [] : List<Next>.from(json["items"].map((x) => Next.fromJson(x))),
    returned: json["returned"],
  );

  Map<String, dynamic> toJson() => {
    "available": available,
    "collectionURI": collectionUri,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    "returned": returned,
  };
}