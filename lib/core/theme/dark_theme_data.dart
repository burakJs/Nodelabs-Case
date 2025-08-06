import 'package:flutter/material.dart';
import 'package:nodelabs_case/core/theme/base_theme_data.dart';
import 'package:nodelabs_case/core/theme/color/app_color_scheme.dart';
import 'package:nodelabs_case/core/theme/color/app_custom_color.dart';

final class DarkThemeData extends BaseThemeData {
  DarkThemeData._();
  static DarkThemeData? _instance;
  static DarkThemeData instance = _instance ??= DarkThemeData._();

  @override
  Color get scaffoldBackgroundColor => AppCustomColor.background;

  @override
  ColorScheme get colorScheme => AppColorScheme().darkColorScheme;
}
