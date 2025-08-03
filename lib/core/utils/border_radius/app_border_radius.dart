import 'package:flutter/cupertino.dart';

final class AppBorderRadius extends BorderRadius {
  /// All 4 radius
  const AppBorderRadius.allLow() : super.all(const Radius.circular(4));

  /// All 8 radius
  const AppBorderRadius.allMedium() : super.all(const Radius.circular(8));

  /// All 12 radius
  const AppBorderRadius.allLarge() : super.all(const Radius.circular(12));

  /// All 16 radius
  const AppBorderRadius.allVeryLarge() : super.all(const Radius.circular(16));

  /// Vertical 4 radius
  const AppBorderRadius.verticalLow()
    : super.vertical(
        top: const Radius.circular(4),
        bottom: const Radius.circular(4),
      );

  /// Vertical 8 radius
  const AppBorderRadius.verticalMedium()
    : super.vertical(
        top: const Radius.circular(8),
        bottom: const Radius.circular(8),
      );

  /// Vertical 12 radius
  const AppBorderRadius.verticalLarge()
    : super.vertical(
        top: const Radius.circular(12),
        bottom: const Radius.circular(12),
      );

  /// Vertical 16 radius
  const AppBorderRadius.verticalVeryLarge()
    : super.vertical(
        top: const Radius.circular(16),
        bottom: const Radius.circular(16),
      );

  /// Horizontal 4 radius
  const AppBorderRadius.horizontalLow()
    : super.horizontal(
        left: const Radius.circular(4),
        right: const Radius.circular(4),
      );

  /// Horizontal 8 radius
  const AppBorderRadius.horizontalMedium()
    : super.horizontal(
        left: const Radius.circular(8),
        right: const Radius.circular(8),
      );

  /// Horizontal 12 radius
  const AppBorderRadius.horizontalLarge()
    : super.horizontal(
        left: const Radius.circular(12),
        right: const Radius.circular(12),
      );

  /// Horizontal 16 radius
  const AppBorderRadius.horizontalVeryLarge()
    : super.horizontal(
        left: const Radius.circular(16),
        right: const Radius.circular(16),
      );

  /// Custom top left, top right, bottom left, bottom right
  AppBorderRadius.custom({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) : super.only(
         topLeft: Radius.circular(topLeft ?? 0),
         topRight: Radius.circular(topRight ?? 0),
         bottomLeft: Radius.circular(bottomLeft ?? 0),
         bottomRight: Radius.circular(bottomRight ?? 0),
       );
}
