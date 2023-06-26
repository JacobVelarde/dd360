

import 'enum_custom_values.dart';

enum UrlType { detail, wiki, comiclink, purchase, reader, inAppLink }

final urlTypeValues = EnumCustomValues({
  "comiclink": UrlType.comiclink,
  "detail": UrlType.detail,
  "wiki": UrlType.wiki,
  "inAppLink": UrlType.inAppLink,
  "purchase": UrlType.purchase,
  "reader": UrlType.reader
});

class Url {
  UrlType? type;
  String? url;

  Url({
    this.type,
    this.url,
  });

  factory Url.fromJson(Map<String, dynamic> json) => Url(
    type: urlTypeValues.map[json["type"]],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "type": urlTypeValues.reverse[type],
    "url": url,
  };
}