import 'package:flutter/material.dart';
import 'package:chuukohin/utils/graphics/color.dart' as color;

class ThemeConstant {
  static Color primaryColor = const Color(0xffB89476);
  static Color secondaryColor = const Color(0xff6C4E37);
  static Color textSecondaryColor = const Color(0xff826751);
  static MaterialColor materialColorSwatch =
      color.createMaterialColor(primaryColor);

  static ThemeData theme = ThemeData(
    primaryColor: ThemeConstant.primaryColor,
    primarySwatch: ThemeConstant.materialColorSwatch,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      centerTitle: true,
      iconTheme: IconThemeData(color: primaryColor),
    ),
    scaffoldBackgroundColor: Colors.white,
    splashColor: Colors.transparent,
  );
}
