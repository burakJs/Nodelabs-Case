import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nodelabs_case/core/localization/localization_enum.dart';

class LocalizationInitializeWidget extends StatelessWidget {
  const LocalizationInitializeWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: LocalizationEnum.supportedLocales,
      path: LocalizationEnum.path,
      fallbackLocale: LocalizationEnum.en.locale,
      useOnlyLangCode: true,
      startLocale: LocalizationEnum.en.locale,
      child: child,
    );
  }
}
