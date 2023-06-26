

import 'enum_custom_values.dart';

enum Extension { jpg, gif }

final extensionValues = EnumCustomValues({
  "gif": Extension.gif,
  "jpg": Extension.jpg
});


class Thumbnail {
  String? path;
  Extension? extension;

  Thumbnail({
    this.path,
    this.extension,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
    path: json["path"],
    extension: extensionValues.map[json["extension"]],
  );

  Map<String, dynamic> toJson() => {
    "path": path,
    "extension": extensionValues.reverse[extension],
  };
}