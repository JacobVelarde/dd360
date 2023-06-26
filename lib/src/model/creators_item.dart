

import 'package:test_dd360/src/model/enum_custom_values.dart';

enum Role { editor, letterer, penciler, writer, colorits, inker, pencillerCover, penciller }

final roleValues = EnumCustomValues({
  "colorist": Role.colorits,
  "editor": Role.editor,
  "inker": Role.inker,
  "letterer": Role.letterer,
  "penciler": Role.penciler,
  "penciller": Role.penciller,
  "penciller (cover)": Role.pencillerCover,
  "writer": Role.writer
});


class CreatorsItem {
  String? resourceUri;
  String? name;
  Role? role;

  CreatorsItem({
    this.resourceUri,
    this.name,
    this.role,
  });

  factory CreatorsItem.fromJson(Map<String, dynamic> json) => CreatorsItem(
    resourceUri: json["resourceURI"],
    name: json["name"],
    role: roleValues.map[json["role"]],
  );

  Map<String, dynamic> toJson() => {
    "resourceURI": resourceUri,
    "name": name,
    "role": roleValues.reverse[role],
  };
}