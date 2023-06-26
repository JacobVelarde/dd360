


import 'package:test_dd360/src/model/enum_custom_values.dart';

enum DateType { onSaleDate, focDate, unlimitedDate, digitalPurchaseDate }

final dateTypeValues = EnumCustomValues({
  "digitalPurchaseDate": DateType.digitalPurchaseDate,
  "focDate": DateType.focDate,
  "onsaleDate": DateType.onSaleDate,
  "unlimitedDate": DateType.unlimitedDate
});

class Date {
  DateType? type;
  String? date;

  Date({
    this.type,
    this.date,
  });

  factory Date.fromJson(Map<String, dynamic> json) => Date(
    type: dateTypeValues.map[json["type"]],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "type": dateTypeValues.reverse[type],
    "date": date,
  };
}