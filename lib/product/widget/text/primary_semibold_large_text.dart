import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:nodelabs_case/product/widget/text/mixin/base_text_mixin.dart';

final class PrimarySemiBoldLargeText extends StatelessWidget
    with BaseTextMixin {
  /// 20px font size and semibold text (Primary Font - Euclid Circular A)
  const PrimarySemiBoldLargeText(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLine,
    this.overflow = TextOverflow.ellipsis,
    this.isUnderline = false,
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
  final bool isUnderline;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.general.textTheme.displayMedium?.copyWith(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        decoration: isUnderline ? TextDecoration.underline : null,
      ),
      maxLines: maxLine,
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}
