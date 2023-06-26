

import 'package:test_dd360/src/model/enum_custom_values.dart';

enum VariantDescription { empty, zombieVarian, spotlightVariant }

final variantDescriptionValues = EnumCustomValues({
  "": VariantDescription.empty,
  "SPOTLIGHT VARIANT": VariantDescription.spotlightVariant,
  "ZOMBIE VARIANT": VariantDescription.zombieVarian
});