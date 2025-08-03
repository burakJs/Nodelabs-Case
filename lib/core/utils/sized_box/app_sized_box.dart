import 'package:flutter/material.dart';

final class AppSizedBox extends SizedBox {
  /// Height 4 px
  const AppSizedBox.heightExtraLow({super.key}) : super(height: 4);

  /// Height 8 px
  const AppSizedBox.heightLow({super.key}) : super(height: 8);

  /// Height 12 px
  const AppSizedBox.heightMedium({super.key}) : super(height: 12);

  /// Height 16 px
  const AppSizedBox.heightHigh({super.key}) : super(height: 16);

  /// Height 24 px
  const AppSizedBox.heightExtraHigh({super.key}) : super(height: 24);

  /// Width 4 px
  const AppSizedBox.widthExtraLow({super.key}) : super(width: 4);

  /// Width 8 px
  const AppSizedBox.widthLow({super.key}) : super(width: 8);

  /// Width 12 px
  const AppSizedBox.widthMedium({super.key}) : super(width: 12);

  /// Width 16 px
  const AppSizedBox.widthHigh({super.key}) : super(width: 16);

  /// Width 24 px
  const AppSizedBox.widthExtraHigh({super.key}) : super(width: 24);
}
