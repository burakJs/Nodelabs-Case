import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:nodelabs_case/core/utils/duration/app_duration.dart';
import 'package:nodelabs_case/product/widget/text/text_widgets.dart';

final class AppSnackBar extends SnackBar {
  AppSnackBar.error({
    required BuildContext context,
    required String message,
    super.key,
  }) : super(
         content: PrimaryRegularSmallText(
           message,
           color: context.general.colorScheme.surface,
         ),
         backgroundColor: context.general.colorScheme.primary,
         duration: const AppDuration.high(),
       );

  AppSnackBar.success({
    required BuildContext context,
    required String message,
    super.key,
  }) : super(
         content: PrimaryRegularSmallText(
           message,
           color: context.general.colorScheme.surface,
         ),
         backgroundColor: context.general.colorScheme.tertiary,
         duration: const AppDuration.high(),
       );
}
