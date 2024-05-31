import 'package:flutter/material.dart';
import 'package:pokeapi/src/core/utils/constants/colors_constants.dart';

// todo: definitive texts
class TextStyleVariantsLight {
  static TextStyleVariantsLight? _shared;
  static TextStyleVariantsLight? get shared {
    _shared ??= TextStyleVariantsLight._init();
    return _shared;
  }

  TextStyleVariantsLight._init();

  final TextStyle titleLarge = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.bold,
    color: ColorsConstants.black,
  );

  final TextStyle titleSmall = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: ColorsConstants.black,
  );

  final TextStyle headline = TextStyle(
    fontSize: 17,
    color: ColorsConstants.black,
  );

  final TextStyle subtitle = TextStyle(
    fontSize: 12,
    color: ColorsConstants.black,
  );
}
