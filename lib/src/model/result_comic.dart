
import 'package:test_dd360/src/model/characters.dart';
import 'package:test_dd360/src/model/price.dart';
import 'package:test_dd360/src/model/series.dart';
import 'package:test_dd360/src/model/stories.dart';
import 'package:test_dd360/src/model/text_object.dart';
import 'package:test_dd360/src/model/thumbnail.dart';
import 'package:test_dd360/src/model/url.dart';
import 'package:test_dd360/src/model/varian_description.dart';

import 'creators.dart';
import 'date.dart';
import 'format.dart';

class ResultComic {
  int? id;
  int? digitalId;
  String? title;
  int? issueNumber;
  VariantDescription? variantDescription;
  String? description;
  String? modified;
  String? isbn;
  String? upc;
  String? diamondCode;
  String? ean;
  String? issn;
  Format? format;
  int? pageCount;
  List<TextObject>? textObjects;
  String? resourceUri;
  List<Url>? urls;
  Series? series;
  List<Series>? variants;
  List<dynamic>? collections;
  List<dynamic>? collectedIssues;
  List<Date>? dates;
  List<Price>? prices;
  Thumbnail? thumbnail;
  List<Thumbnail>? images;
  Creators? creators;
  Characters? characters;
  Stories? stories;
  Characters? events;

  ResultComic({
    this.id,
    this.digitalId,
    this.title,
    this.issueNumber,
    this.variantDescription,
    this.description,
    this.modified,
    this.isbn,
    this.upc,
    this.diamondCode,
    this.ean,
    this.issn,
    this.format,
    this.pageCount,
    this.textObjects,
    this.resourceUri,
    this.urls,
    this.series,
    this.variants,
    this.collections,
    this.collectedIssues,
    this.dates,
    this.prices,
    this.thumbnail,
    this.images,
    this.creators,
    this.characters,
    this.stories,
    this.events,
  });

  factory ResultComic.fromJson(Map<String, dynamic> json) => ResultComic(
    id: json["id"],
    digitalId: json["digitalId"],
    title: json["title"],
    issueNumber: json["issueNumber"],
    variantDescription: variantDescriptionValues.map[json["variantDescription"]],
    description: json["description"],
    modified: json["modified"],
    isbn: json["isbn"],
    upc: json["upc"],
    diamondCode: json["diamondCode"],
    ean: json["ean"],
    issn: json["issn"],
    format: formatValues.map[json["format"]],
    pageCount: json["pageCount"],
    textObjects: json["textObjects"] == null ? [] : List<TextObject>.from(json["textObjects"].map((x) => TextObject.fromJson(x))),
    resourceUri: json["resourceURI"],
    urls: json["urls"] == null ? [] : List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
    series: json["series"] == null ? null : Series.fromJson(json["series"]),
    variants: json["variants"] == null ? [] : List<Series>.from(json["variants"].map((x) => Series.fromJson(x))),
    collections: json["collections"] == null ? [] : List<dynamic>.from(json["collections"].map((x) => x)),
    collectedIssues: json["collectedIssues"] == null ? [] : List<dynamic>.from(json["collectedIssues"].map((x) => x)),
    dates: json["dates"] == null ? [] : List<Date>.from(json["dates"].map((x) => Date.fromJson(x))),
    prices: json["prices"] == null ? [] : List<Price>.from(json["prices"].map((x) => Price.fromJson(x))),
    thumbnail: json["thumbnail"] == null ? null : Thumbnail.fromJson(json["thumbnail"]),
    images: json["images"] == null ? [] : List<Thumbnail>.from(json["images"].map((x) => Thumbnail.fromJson(x))),
    creators: json["creators"] == null ? null : Creators.fromJson(json["creators"]),
    characters: json["characters"] == null ? null : Characters.fromJson(json["characters"]),
    stories: json["stories"] == null ? null : Stories.fromJson(json["stories"]),
    events: json["events"] == null ? null : Characters.fromJson(json["events"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "digitalId": digitalId,
    "title": title,
    "issueNumber": issueNumber,
    "variantDescription": variantDescriptionValues.reverse[variantDescription],
    "description": description,
    "modified": modified,
    "isbn": isbn,
    "upc": upc,
    "diamondCode": diamondCode,
    "ean": ean,
    "issn": issn,
    "format": formatValues.reverse[format],
    "pageCount": pageCount,
    "textObjects": textObjects == null ? [] : List<dynamic>.from(textObjects!.map((x) => x.toJson())),
    "resourceURI": resourceUri,
    "urls": urls == null ? [] : List<dynamic>.from(urls!.map((x) => x.toJson())),
    "series": series?.toJson(),
    "variants": variants == null ? [] : List<dynamic>.from(variants!.map((x) => x.toJson())),
    "collections": collections == null ? [] : List<dynamic>.from(collections!.map((x) => x)),
    "collectedIssues": collectedIssues == null ? [] : List<dynamic>.from(collectedIssues!.map((x) => x)),
    "dates": dates == null ? [] : List<dynamic>.from(dates!.map((x) => x.toJson())),
    "prices": prices == null ? [] : List<dynamic>.from(prices!.map((x) => x.toJson())),
    "thumbnail": thumbnail?.toJson(),
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
    "creators": creators?.toJson(),
    "characters": characters?.toJson(),
    "stories": stories?.toJson(),
    "events": events?.toJson(),
  };
}