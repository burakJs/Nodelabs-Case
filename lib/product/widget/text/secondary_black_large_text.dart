import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:nodelabs_case/product/generated/fonts.gen.dart';
import 'package:nodelabs_case/product/widget/text/mixin/base_text_mixin.dart';

/// 25px font size and black text (Secondary Font - Montserrat)
final class SecondaryBlackLargeText extends StatelessWidget with BaseTextMixin {
  const SecondaryBlackLargeText(
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
      style: context.general.textTheme.displayLarge?.copyWith(
        color: color,
        fontFamily: FontFamily.montserrat,
        fontWeight: FontWeight.w900,
      ),
      maxLines: maxLine,
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}
