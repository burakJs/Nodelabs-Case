import 'package:flutter/material.dart';

mixin BaseTextMixin on StatelessWidget {
  String get text;
  Color? get color;
  TextAlign? get textAlign;
  int? get maxLine;
  TextOverflow? get overflow;
}
