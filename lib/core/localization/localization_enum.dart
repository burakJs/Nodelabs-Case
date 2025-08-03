import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nodelabs_case/product/generated/locale_keys.g.dart';

enum LocalizationEnum {
  en(Locale('en', 'US')),
  tr(Locale('tr', 'TR'));

  const LocalizationEnum(this._locale);
  final Locale _locale;

  Locale get locale => _locale;
  String get languageName => LocaleKeys.language_name.tr();

  static List<Locale> get supportedLocales =>
      values.map((e) => e._locale).toList();

  static String get path => 'assets/translations';

  void changeLocale(BuildContext context) {
    context.setLocale(_locale);
  }

  static LocalizationEnum currentLocale(BuildContext context) {
    final currentLocale = context.locale;
    return values.firstWhere((e) => e._locale == currentLocale);
  }
}
