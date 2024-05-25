import 'package:flutter/material.dart';
import 'package:krishi/utils/theme/custom_themes/app_bar_theme.dart';
import 'package:krishi/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:krishi/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:krishi/utils/theme/custom_themes/chip_theme.dart';
import 'package:krishi/utils/theme/custom_themes/color_scheme.dart';
import 'package:krishi/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:krishi/utils/theme/custom_themes/icon_theme.dart';
import 'package:krishi/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:krishi/utils/theme/custom_themes/text_field_theme.dart';
import 'package:krishi/utils/theme/custom_themes/text_theme.dart';

class CAppTheme {
  CAppTheme._(); // private constructor

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    colorScheme: CColorScheme.light,
    // scaffoldBackgroundColor: const Color.fromARGB(255, 240, 255, 244),
    textTheme: CTextTheme.lightTextTheme,
    elevatedButtonTheme: CElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: CAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: CBottomSheetTheme.lightBottomSheetThemeData,
    checkboxTheme: CCheckboxTheme.lightChecboxThemeData,
    chipTheme: CChipTheme.lightChipTheme,
    outlinedButtonTheme: COutlineButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme: CTextFieldTheme.lightInputDecorationTheme,
    iconTheme: CIconTheme.light,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    colorScheme: CColorScheme.dark,
    scaffoldBackgroundColor: Colors.black,
    textTheme: CTextTheme.darkTextTheme,
    elevatedButtonTheme: CElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: CAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: CBottomSheetTheme.darkBottomSheetThemeData,
    checkboxTheme: CCheckboxTheme.darkChecboxThemeData,
    chipTheme: CChipTheme.darkChipTheme,
    outlinedButtonTheme: COutlineButtonTheme.darkOutlineButtonTheme,
    inputDecorationTheme: CTextFieldTheme.darkInputDecorationTheme,
    iconTheme: CIconTheme.dark,
  );
}
