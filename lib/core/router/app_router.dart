import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nodelabs_case/core/router/app_routes.dart';
import 'package:nodelabs_case/core/router/app_shell_routes.dart';

@immutable
final class AppRouter {
  const AppRouter._();

  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  static final GlobalKey<StatefulNavigationShellState> _shellKey =
      GlobalKey<StatefulNavigationShellState>();

  static GoRouter router = GoRouter(
    navigatorKey: _navigatorKey,
    initialLocation: AppRoutes.initialPath,
    routes: [
      ...AppRoutes.values.map(
        (e) => GoRoute(
          path: e.path,
          parentNavigatorKey: _navigatorKey,
          builder: (context, state) => e.pageBuilder(context, state),
        ),
      ),
      StatefulShellRoute.indexedStack(
        key: _shellKey,
        builder: (context, state, navigationShell) {
          // return TabsView(navigationShell: navigationShell);
          return const Scaffold();
        },
        branches: AppShellRoutes.values.map((e) => e.branch).toList(),
      ),
    ],
  );
}
