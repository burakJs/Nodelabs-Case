import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:nodelabs_case/product/widget/text/mixin/base_text_mixin.dart';

/// 13px font size and regular text (Primary Font - Euclid Circular A)
final class PrimaryRegularSmallText extends StatelessWidget with BaseTextMixin {
  const PrimaryRegularSmallText(
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
      style: context.general.textTheme.bodySmall?.copyWith(color: color),
      maxLines: maxLine,
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}
