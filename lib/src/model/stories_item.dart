
import 'enum_custom_values.dart';

enum ItemType { cover, interiorStory, empty, textStory }

final itemTypeValues = EnumCustomValues({
  "cover": ItemType.cover,
  "empty": ItemType.empty,
  "interiorStory": ItemType.interiorStory,
  "text story": ItemType.textStory
});


class StoriesItem {
  String? resourceUri;
  String? name;
  ItemType? type;

  StoriesItem({
    this.resourceUri,
    this.name,
    this.type,
  });

  factory StoriesItem.fromJson(Map<String, dynamic> json) => StoriesItem(
    resourceUri: json["resourceURI"],
    name: json["name"],
    type: itemTypeValues.map[json["type"]],
  );

  Map<String, dynamic> toJson() => {
    "resourceURI": resourceUri,
    "name": name,
    "type": itemTypeValues.reverse[type],
  };
}