import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:nodelabs_case/product/widget/text/mixin/base_text_mixin.dart';

/// 20px font size and semibold text (Primary Font - Euclid Circular A)
final class PrimarySemiBoldLargeText extends StatelessWidget
    with BaseTextMixin {
  const PrimarySemiBoldLargeText(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLine,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  final String text;
  @override
  final Color? color;
  @override
  final TextAlign? textAlign;
  @override
  final int? maxLine;
  @override
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.general.textTheme.displayMedium?.copyWith(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      maxLines: maxLine,
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}
