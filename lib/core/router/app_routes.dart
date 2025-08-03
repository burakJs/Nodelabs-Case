import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoutes {
  splash('/');

  const AppRoutes(this.path);

  final String path;

  static String get initialPath => AppRoutes.splash.path;

  Widget pageBuilder(BuildContext context, GoRouterState state) {
    return switch (this) {
      AppRoutes.splash => const Scaffold(),
    };
  }
}
