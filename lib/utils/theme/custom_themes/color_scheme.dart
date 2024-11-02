import 'package:flutter/material.dart';
import 'package:krishi/utils/constants/colors.dart';

class CColorScheme {
  static ColorScheme light = ColorScheme(
      brightness: Brightness.light,
      primary: CColors.primary,
      onPrimary: CColors.primaryBackground,
      secondary: CColors.secondary,
      onSecondary: CColors.borderSecondary,
      error: CColors.error,
      onError: CColors.warning,
      background: CColors.lightContainer,
      onBackground: CColors.darkContainer,
      surface: CColors.accent,
      onSurface: CColors.light,
      tertiary: CColors.black,
      onTertiary: Colors.white);

  static ColorScheme dark = ColorScheme(
    brightness: Brightness.dark,
    primary: CColors.primary,
    onPrimary: CColors.primaryBackground,
    secondary: CColors.secondary,
    onSecondary: CColors.borderSecondary,
    error: CColors.error,
    onError: CColors.warning,
    background: CColors.lightContainer,
    onBackground: CColors.darkContainer,
    surface: CColors.accent,
    onSurface: CColors.light,
    tertiary: CColors.white,
    onTertiary: const Color.fromARGB(255, 54, 54, 54),
  );
}
