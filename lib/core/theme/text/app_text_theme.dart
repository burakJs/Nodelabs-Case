import 'package:flutter/src/painting/text_style.dart';
import 'package:nodelabs_case/core/theme/text/base_text_theme.dart';

final class AppTextTheme extends BaseTextTheme {
  @override
  TextStyle get large => TextStyle(fontSize: 25);

  @override
  TextStyle get medium => TextStyle(fontSize: 18);

  @override
  TextStyle get normal => TextStyle(fontSize: 15);

  @override
  TextStyle get small => TextStyle(fontSize: 13);

  @override
  TextStyle get verySmall => TextStyle(fontSize: 12);
}
