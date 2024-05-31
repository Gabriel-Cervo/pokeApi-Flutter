import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokeapi/src/core/styles/text_style_variants_light.dart';
import 'package:pokeapi/src/core/utils/constants/colors_constants.dart';

class AppThemeLight {
  static ThemeData theme = ThemeData(
      textTheme: TextTheme(
        titleLarge: TextStyleVariantsLight.shared?.titleLarge,
        titleSmall: TextStyleVariantsLight.shared?.titleSmall,
        displayLarge: TextStyleVariantsLight.shared?.headline,
        bodyMedium: TextStyleVariantsLight.shared?.subtitle,
        bodyLarge: TextStyleVariantsLight.shared?.bodyLarge,
        displayMedium: TextStyleVariantsLight.shared?.subtitleGray,
      ),
      appBarTheme: ThemeData.light().appBarTheme.copyWith(
            color: ColorsConstants.white,
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
      dividerColor: ColorsConstants.gray,
      scaffoldBackgroundColor: ColorsConstants.backgroundGray,
      listTileTheme: ListTileThemeData(tileColor: ColorsConstants.white));
}
