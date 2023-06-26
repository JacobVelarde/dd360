
import 'package:test_dd360/src/model/characters.dart';
import 'package:test_dd360/src/model/creators.dart';
import 'package:test_dd360/src/model/original_issue.dart';
import 'package:test_dd360/src/model/stories_item.dart';

class ResultStories {
  int? id;
  String? title;
  String? description;
  String? resourceUri;
  ItemType? type;
  String? modified;
  dynamic thumbnail;
  Creators? creators;
  Characters? characters;
  Characters? series;
  Characters? comics;
  Characters? events;
  OriginalIssue? originalIssue;

  ResultStories({
    this.id,
    this.title,
    this.description,
    this.resourceUri,
    this.type,
    this.modified,
    this.thumbnail,
    this.creators,
    this.characters,
    this.series,
    this.comics,
    this.events,
    this.originalIssue,
  });

  factory ResultStories.fromJson(Map<String, dynamic> json) => ResultStories(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    resourceUri: json["resourceURI"],
    type: itemTypeValues.map[json["type"]],
    modified: json["modified"],
    thumbnail: json["thumbnail"],
    creators: json["creators"] == null ? null : Creators.fromJson(json["creators"]),
    characters: json["characters"] == null ? null : Characters.fromJson(json["characters"]),
    series: json["series"] == null ? null : Characters.fromJson(json["series"]),
    comics: json["comics"] == null ? null : Characters.fromJson(json["comics"]),
    events: json["events"] == null ? null : Characters.fromJson(json["events"]),
    originalIssue: json["originalIssue"] == null ? null : OriginalIssue.fromJson(json["originalIssue"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "resourceURI": resourceUri,
    "type": itemTypeValues.reverse[type],
    "modified": modified,
    "thumbnail": thumbnail,
    "creators": creators?.toJson(),
    "characters": characters?.toJson(),
    "series": series?.toJson(),
    "comics": comics?.toJson(),
    "events": events?.toJson(),
    "originalIssue": originalIssue?.toJson(),
  };
}