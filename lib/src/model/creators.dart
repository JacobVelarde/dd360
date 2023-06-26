

import 'package:test_dd360/src/model/creators_item.dart';

class Creators {
  int? available;
  String? collectionUri;
  List<CreatorsItem>? items;
  int? returned;

  Creators({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  factory Creators.fromJson(Map<String, dynamic> json) => Creators(
    available: json["available"],
    collectionUri: json["collectionURI"],
    items: json["items"] == null ? [] : List<CreatorsItem>.from(json["items"].map((x) => CreatorsItem.fromJson(x))),
    returned: json["returned"],
  );

  Map<String, dynamic> toJson() => {
    "available": available,
    "collectionURI": collectionUri,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    "returned": returned,
  };
}