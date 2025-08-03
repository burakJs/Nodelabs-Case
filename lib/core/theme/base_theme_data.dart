import 'package:flutter/material.dart';
import 'package:nodelabs_case/product/generated/fonts.gen.dart';

abstract class BaseThemeData {
  ColorScheme get colorScheme;

  ThemeData get theme => ThemeData(
    fontFamily: FontFamily.euclidCircularA,
    colorScheme: colorScheme,
  );
}
