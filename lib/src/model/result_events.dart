
import 'package:test_dd360/src/model/characters.dart';
import 'package:test_dd360/src/model/creators.dart';
import 'package:test_dd360/src/model/next.dart';
import 'package:test_dd360/src/model/stories.dart';
import 'package:test_dd360/src/model/thumbnail.dart';
import 'package:test_dd360/src/model/url.dart';

class ResultEvents {
  int? id;
  String? title;
  String? description;
  String? resourceUri;
  List<Url>? urls;
  String? modified;
  DateTime? start;
  DateTime? end;
  Thumbnail? thumbnail;
  Creators? creators;
  Characters? characters;
  Stories? stories;
  Characters? comics;
  Characters? series;
  Next? next;
  Next? previous;

  ResultEvents({
    this.id,
    this.title,
    this.description,
    this.resourceUri,
    this.urls,
    this.modified,
    this.start,
    this.end,
    this.thumbnail,
    this.creators,
    this.characters,
    this.stories,
    this.comics,
    this.series,
    this.next,
    this.previous,
  });

  factory ResultEvents.fromJson(Map<String, dynamic> json) => ResultEvents(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    resourceUri: json["resourceURI"],
    urls: json["urls"] == null ? [] : List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
    modified: json["modified"],
    start: json["start"] == null ? null : DateTime.parse(json["start"]),
    end: json["end"] == null ? null : DateTime.parse(json["end"]),
    thumbnail: json["thumbnail"] == null ? null : Thumbnail.fromJson(json["thumbnail"]),
    creators: json["creators"] == null ? null : Creators.fromJson(json["creators"]),
    characters: json["characters"] == null ? null : Characters.fromJson(json["characters"]),
    stories: json["stories"] == null ? null : Stories.fromJson(json["stories"]),
    comics: json["comics"] == null ? null : Characters.fromJson(json["comics"]),
    series: json["series"] == null ? null : Characters.fromJson(json["series"]),
    next: json["next"] == null ? null : Next.fromJson(json["next"]),
    previous: json["previous"] == null ? null : Next.fromJson(json["previous"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "resourceURI": resourceUri,
    "urls": urls == null ? [] : List<dynamic>.from(urls!.map((x) => x.toJson())),
    "modified": modified,
    "start": start?.toIso8601String(),
    "end": end?.toIso8601String(),
    "thumbnail": thumbnail?.toJson(),
    "creators": creators?.toJson(),
    "characters": characters?.toJson(),
    "stories": stories?.toJson(),
    "comics": comics?.toJson(),
    "series": series?.toJson(),
    "next": next?.toJson(),
    "previous": previous?.toJson(),
  };
}