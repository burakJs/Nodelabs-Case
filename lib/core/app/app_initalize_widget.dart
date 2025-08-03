import 'package:flutter/material.dart';
import 'package:nodelabs_case/core/app/context_initialize_widget.dart';
import 'package:nodelabs_case/core/localization/localization_initialize_widget.dart';

final class AppInitializeWidget extends StatelessWidget {
  const AppInitializeWidget({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LocalizationInitializeWidget(
      child: ContextInitializeWidget(child: child),
    );
  }
}
