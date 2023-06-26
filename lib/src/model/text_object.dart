


import 'package:test_dd360/src/model/enum_custom_values.dart';

enum Language { EN_US }

final languageValues = EnumCustomValues({
  "en-us": Language.EN_US
});

enum TextObjectType { issuePreviewText, issueSolicitText }

final textObjectTypeValues = EnumCustomValues({
  "issue_preview_text": TextObjectType.issuePreviewText,
  "issue_solicit_text": TextObjectType.issueSolicitText
});

class TextObject {
  TextObjectType? type;
  Language? language;
  String? text;

  TextObject({
    this.type,
    this.language,
    this.text,
  });

  factory TextObject.fromJson(Map<String, dynamic> json) => TextObject(
    type: textObjectTypeValues.map[json["type"]],
    language: languageValues.map[json["language"]],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "type": textObjectTypeValues.reverse[type],
    "language": languageValues.reverse[language],
    "text": text,
  };
}