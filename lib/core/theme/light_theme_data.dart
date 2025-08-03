import 'package:flutter/material.dart';
import 'package:nodelabs_case/core/theme/base_theme_data.dart';
import 'package:nodelabs_case/core/theme/color/app_color_scheme.dart';

final class LightThemeData extends BaseThemeData {
  LightThemeData._();
  static LightThemeData? _instance;
  static LightThemeData instance = _instance ??= LightThemeData._();

  @override
  ColorScheme get colorScheme => AppColorScheme().lightColorScheme;
}
