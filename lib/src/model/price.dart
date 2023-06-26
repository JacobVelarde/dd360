

import 'package:test_dd360/src/model/enum_custom_values.dart';

enum PriceType { printPrice, digitalPurchasePrice }

final priceTypeValues = EnumCustomValues({
  "digitalPurchasePrice": PriceType.digitalPurchasePrice,
  "printPrice": PriceType.printPrice
});

class Price {
  PriceType? type;
  double? price;

  Price({
    this.type,
    this.price,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    type: priceTypeValues.map[json["type"]],
    price: json["price"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "type": priceTypeValues.reverse[type],
    "price": price,
  };
}