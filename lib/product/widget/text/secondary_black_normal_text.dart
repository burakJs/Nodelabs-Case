import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:nodelabs_case/product/generated/fonts.gen.dart';
import 'package:nodelabs_case/product/widget/text/mixin/base_text_mixin.dart';

final class SecondaryBlackNormalText extends StatelessWidget
    with BaseTextMixin {
  /// 15px font size and black text (Secondary Font - Montserrat)
  const SecondaryBlackNormalText(
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
      style: context.general.textTheme.titleMedium?.copyWith(
        color: color,
        fontFamily: FontFamily.montserrat,
        fontWeight: FontWeight.w900,
        decoration: isUnderline ? TextDecoration.underline : null,
      ),
      maxLines: maxLine,
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}
