import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:nodelabs_case/core/utils/border_radius/app_border_radius.dart';
import 'package:nodelabs_case/core/utils/padding/app_padding.dart';
import 'package:nodelabs_case/product/widget/text/primary_medium_normal_text.dart';

final class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isSmall = false,
  });

  final FutureOr<void> Function() onPressed;
  final String text;
  final bool isSmall;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

final class _PrimaryButtonState extends State<PrimaryButton> {
  bool isLoading = false;

  void _onPressed() async {
    isLoading = true;
    setState(() {});
    await widget.onPressed();
    isLoading = false;
    setState(() {});
  }

  EdgeInsets get padding =>
      widget.isSmall ? AppPadding.verticalMedium() : AppPadding.verticalXHigh();

  BorderRadius get borderRadius => widget.isSmall
      ? AppBorderRadius.allMedium()
      : AppBorderRadius.allVeryLarge();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: context.general.colorScheme.primary,
        padding: padding + AppPadding.horizontalXHigh(),
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: isLoading
            ? SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: context.general.colorScheme.onPrimary,
                ),
              )
            : PrimaryMediumNormalText(widget.text),
      ),
    );
  }
}
