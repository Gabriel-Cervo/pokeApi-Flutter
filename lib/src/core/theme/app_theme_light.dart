import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokeapi/src/core/styles/text_style_variants_light.dart';

class AppThemeLight {
  static ThemeData theme = ThemeData(
    textTheme: TextTheme(
      displayLarge: TextStyleVariantsLight.shared?.headline1,
      displayMedium: TextStyleVariantsLight.shared?.headline2,
    ),
    appBarTheme: ThemeData.light().appBarTheme.copyWith(
          elevation: 0,
          centerTitle: true,
          color: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
    scaffoldBackgroundColor: Colors.white,
  );
}
