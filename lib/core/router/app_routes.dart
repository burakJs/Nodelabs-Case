import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nodelabs_case/feature/splash/splash_view.dart';

enum AppRoutes {
  splash('/'),
  login('/login'),
  register('/register'),
  uploadPhoto('/upload-photo  ');

  const AppRoutes(this.path);

  final String path;

  static String get initialPath => AppRoutes.splash.path;

  Widget pageBuilder(BuildContext context, GoRouterState state) {
    return switch (this) {
      AppRoutes.splash => const SplashView(),
      AppRoutes.login => const Scaffold(),
      AppRoutes.register => const Scaffold(),
      AppRoutes.uploadPhoto => const Scaffold(),
    };
  }
}
