import 'package:flutter/material.dart';
import 'package:nodelabs_case/core/theme/text/app_text_theme.dart';
import 'package:nodelabs_case/product/generated/fonts.gen.dart';

abstract class BaseThemeData {
  ColorScheme get colorScheme;
  Color get scaffoldBackgroundColor;

  ThemeData get theme => ThemeData(
    fontFamily: FontFamily.euclidCircularA,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    textTheme: AppTextTheme().theme,
  );
}
