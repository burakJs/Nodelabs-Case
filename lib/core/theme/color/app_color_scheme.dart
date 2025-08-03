import 'package:flutter/material.dart';
import 'package:nodelabs_case/core/theme/color/app_custom_color.dart';
import 'package:nodelabs_case/core/theme/color/base_color_scheme.dart';

final class AppColorScheme extends BaseColorScheme {
  @override
  ColorScheme get darkColorScheme => ColorScheme.dark(
    primary: AppCustomColor.primary,
    onPrimary: AppCustomColor.textPrimary,
    primaryContainer: AppCustomColor.primaryLight,
    onPrimaryContainer: AppCustomColor.textPrimary,
    secondary: AppCustomColor.secondary,
    onSecondary: AppCustomColor.textPrimary,
    secondaryContainer: AppCustomColor.secondaryDark,
    onSecondaryContainer: AppCustomColor.textPrimary,
    surface: AppCustomColor.backgroundCard,
    onSurface: AppCustomColor.textPrimary,
    surfaceTint: AppCustomColor.primaryLight,
    surfaceDim: AppCustomColor.backgroundCard,
    surfaceBright: AppCustomColor.backgroundCard,
    surfaceContainerLowest: AppCustomColor.background,
    surfaceContainerLow: AppCustomColor.backgroundCard,
    surfaceContainer: AppCustomColor.backgroundCard,
    surfaceContainerHigh: AppCustomColor.backgroundCard,
    surfaceContainerHighest: AppCustomColor.backgroundCard,
    error: AppCustomColor.primary,
    onError: AppCustomColor.textPrimary,
    outline: AppCustomColor.borderPrimary,
    outlineVariant: AppCustomColor.borderSecondary,
    shadow: AppCustomColor.shadowPrimary,
    scrim: AppCustomColor.overlayDark,
    inversePrimary: AppCustomColor.primaryLight,
    inverseSurface: AppCustomColor.backgroundOverlay,
    onInverseSurface: AppCustomColor.textPrimary,
  );

  @override
  ColorScheme get lightColorScheme => ColorScheme.light();
}
