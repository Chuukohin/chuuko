import 'package:flutter/material.dart';
import 'package:chuukohin/utils/graphics/color.dart' as color;

class ThemeConstant {
  static Color primaryColor = const Color(0xffB89476);
  static Color secondaryColor = const Color(0xff6C4E37);
  static Color textSecondaryColor = const Color(0xff826751);
  static Color productTextColor = const Color(0xffDCB9A3);
  static Color dividerColor = const Color(0xffC1C1C1);
  static Color logOutBtnColor = const Color(0xffFF3838);
  static Color profileTextColor = const Color(0xff434343);

  static MaterialColor materialColorSwatch =
      color.createMaterialColor(primaryColor);

  static ThemeData theme = ThemeData(
    primaryColor: ThemeConstant.primaryColor,
    primarySwatch: ThemeConstant.materialColorSwatch,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      iconTheme: IconThemeData(
        color: primaryColor,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    splashColor: Colors.transparent,
  );
}
