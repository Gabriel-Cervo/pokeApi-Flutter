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

  final TextStyle headline1 = TextStyle(
    fontSize: 17,
    color: ColorsConstants.black,
  );

  final TextStyle headline2 = TextStyle(
    fontSize: 18,
    color: ColorsConstants.black,
  );

  final TextStyle subtitle1 = TextStyle(
    fontSize: 11,
    color: ColorsConstants.black,
  );

  final TextStyle subtitle2 = TextStyle(
    fontSize: 15,
    color: ColorsConstants.black,
  );
}
