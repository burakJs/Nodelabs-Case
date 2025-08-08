import 'package:flutter/material.dart';

enum TokenPackageEnum {
  small,
  medium,
  large;

  const TokenPackageEnum();

  String get originalPrice => switch (this) {
    small => '200',
    medium => '2.000',
    large => '1.000',
  };

  String get discountedPrice => switch (this) {
    small => '330',
    medium => '3.375',
    large => '1.350',
  };

  String get priceText => switch (this) {
    small => '₺99,99',
    medium => '₺799,99',
    large => '₺399,99',
  };

  String get discountPercent => switch (this) {
    small => '+10%',
    medium => '+70%',
    large => '+35%',
  };

  List<Color> get gradientColors => switch (this) {
    small => [const Color(0xFF6F060B), const Color(0xFFE50914)],
    medium => [const Color(0xFF5949E6), const Color(0xFFE50914)],
    large => [const Color(0xFF6F060B), const Color(0xFFE50914)],
  };

  Color get discountBadgeColor => switch (this) {
    small => const Color(0xFF6F060B),
    medium => const Color(0xFF5949E6),
    large => const Color(0xFF6F060B),
  };

  bool get isSpecial => this == medium;
}
