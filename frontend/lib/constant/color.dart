import 'package:flutter/material.dart';
import 'package:chuukohin/utils/graphics/color.dart' as color;

class ThemeConstant {
  static Color primaryColor = const Color(0xffB89476);
  static Color secondaryColor = const Color(0xff6C4E37);
  static MaterialColor materialColorSwatch =
      color.createMaterialColor(primaryColor);

  static ThemeData theme = ThemeData(
    primaryColor: ThemeConstant.primaryColor,
    primarySwatch: ThemeConstant.materialColorSwatch,
    appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xf2F9F9F9), foregroundColor: Colors.black),
    scaffoldBackgroundColor: Colors.white,
  );
}
