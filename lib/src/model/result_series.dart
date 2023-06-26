
import 'package:test_dd360/src/model/characters.dart';
import 'package:test_dd360/src/model/stories.dart';
import 'package:test_dd360/src/model/thumbnail.dart';
import 'package:test_dd360/src/model/url.dart';

import 'creators.dart';
import 'next.dart';

class ResultSeries {
  int? id;
  String? title;
  String? description;
  String? resourceUri;
  List<Url>? urls;
  int? startYear;
  int? endYear;
  String? rating;
  String? type;
  String? modified;
  Thumbnail? thumbnail;
  Creators? creators;
  Characters? characters;
  Stories? stories;
  Characters? comics;
  Characters? events;
  Next? next;
  Next? previous;

  ResultSeries({
    this.id,
    this.title,
    this.description,
    this.resourceUri,
    this.urls,
    this.startYear,
    this.endYear,
    this.rating,
    this.type,
    this.modified,
    this.thumbnail,
    this.creators,
    this.characters,
    this.stories,
    this.comics,
    this.events,
    this.next,
    this.previous,
  });

  factory ResultSeries.fromJson(Map<String, dynamic> json) => ResultSeries(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    resourceUri: json["resourceURI"],
    urls: json["urls"] == null ? [] : List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
    startYear: json["startYear"],
    endYear: json["endYear"],
    rating: json["rating"],
    type: json["type"],
    modified: json["modified"],
    thumbnail: json["thumbnail"] == null ? null : Thumbnail.fromJson(json["thumbnail"]),
    creators: json["creators"] == null ? null : Creators.fromJson(json["creators"]),
    characters: json["characters"] == null ? null : Characters.fromJson(json["characters"]),
    stories: json["stories"] == null ? null : Stories.fromJson(json["stories"]),
    comics: json["comics"] == null ? null : Characters.fromJson(json["comics"]),
    events: json["events"] == null ? null : Characters.fromJson(json["events"]),
    next: json["next"] == null ? null : Next.fromJson(json["next"]),
    previous: json["previous"] == null ? null : Next.fromJson(json["previous"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "resourceURI": resourceUri,
    "urls": urls == null ? [] : List<dynamic>.from(urls!.map((x) => x.toJson())),
    "startYear": startYear,
    "endYear": endYear,
    "rating": rating,
    "type": type,
    "modified": modified,
    "thumbnail": thumbnail?.toJson(),
    "creators": creators?.toJson(),
    "characters": characters?.toJson(),
    "stories": stories?.toJson(),
    "comics": comics?.toJson(),
    "events": events?.toJson(),
    "next": next?.toJson(),
    "previous": previous?.toJson(),
  };
}