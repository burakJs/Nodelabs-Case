import 'package:flutter/material.dart';

abstract class BaseTextTheme {
  TextStyle get large;
  TextStyle get medium;
  TextStyle get normal;
  TextStyle get small;
  TextStyle get verySmall;

  FontWeight get _semibold => FontWeight.w600;
  FontWeight get _medium => FontWeight.w500;
  FontWeight get _regular => FontWeight.w400;

  TextTheme get theme => TextTheme(
    displayLarge: large.copyWith(fontWeight: _semibold),
    displayMedium: large.copyWith(fontWeight: _medium),
    displaySmall: large.copyWith(fontWeight: _regular),
    headlineLarge: medium.copyWith(fontWeight: _semibold),
    headlineMedium: medium.copyWith(fontWeight: _medium),
    headlineSmall: medium.copyWith(fontWeight: _regular),
    titleLarge: normal.copyWith(fontWeight: _semibold),
    titleMedium: normal.copyWith(fontWeight: _medium),
    titleSmall: normal.copyWith(fontWeight: _regular),
    bodyLarge: small.copyWith(fontWeight: _semibold),
    bodyMedium: small.copyWith(fontWeight: _medium),
    bodySmall: small.copyWith(fontWeight: _regular),
    labelLarge: verySmall.copyWith(fontWeight: _semibold),
    labelMedium: verySmall.copyWith(fontWeight: _medium),
    labelSmall: verySmall.copyWith(fontWeight: _regular),
  );
}
