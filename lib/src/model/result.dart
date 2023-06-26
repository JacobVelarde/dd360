

import 'package:test_dd360/src/model/stories.dart';

import 'comic.dart';
import 'thumbnail.dart';
import 'url.dart';

class Result {
  int? id;
  String? name;
  String? description;
  String? modified;
  Thumbnail? thumbnail;
  String? resourceUri;
  Comics? comics;
  Comics? series;
  Stories? stories;
  Comics? events;
  List<Url>? urls;

  Result({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.thumbnail,
    this.resourceUri,
    this.comics,
    this.series,
    this.stories,
    this.events,
    this.urls,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    modified: json["modified"],
    thumbnail: json["thumbnail"] == null ? null : Thumbnail.fromJson(json["thumbnail"]),
    resourceUri: json["resourceURI"],
    comics: json["comics"] == null ? null : Comics.fromJson(json["comics"]),
    series: json["series"] == null ? null : Comics.fromJson(json["series"]),
    stories: json["stories"] == null ? null : Stories.fromJson(json["stories"]),
    events: json["events"] == null ? null : Comics.fromJson(json["events"]),
    urls: json["urls"] == null ? [] : List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "modified": modified,
    "thumbnail": thumbnail?.toJson(),
    "resourceURI": resourceUri,
    "comics": comics?.toJson(),
    "series": series?.toJson(),
    "stories": stories?.toJson(),
    "events": events?.toJson(),
    "urls": urls == null ? [] : List<dynamic>.from(urls!.map((x) => x.toJson())),
  };
}