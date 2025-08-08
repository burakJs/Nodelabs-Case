import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nodelabs_case/feature/home/home_view.dart';
import 'package:nodelabs_case/feature/profile/profile_view.dart';
import 'package:nodelabs_case/product/generated/assets.gen.dart';
import 'package:nodelabs_case/product/generated/locale_keys.g.dart';

enum AppShellRoutes {
  home('/home'),
  profile('/profile');

  final String path;

  const AppShellRoutes(this.path);

  static String get initialPath => AppShellRoutes.home.path;

  StatefulShellBranch get branch {
    return StatefulShellBranch(
      routes: [
        GoRoute(
          path: path,
          builder: (context, state) => pageBuilder(context, state),
        ),
      ],
    );
  }

  Widget pageBuilder(BuildContext context, GoRouterState state) {
    return switch (this) {
      AppShellRoutes.home => const HomeView(),
      AppShellRoutes.profile => const ProfileView(),
    };
  }

  SvgGenImage get icon => switch (this) {
    AppShellRoutes.home => Assets.svg.homeTab,
    AppShellRoutes.profile => Assets.svg.profileTab,
  };

  SvgGenImage get activeIcon => switch (this) {
    AppShellRoutes.home => Assets.svg.homeTab,
    AppShellRoutes.profile => Assets.svg.profileTab,
  };

  String get label => switch (this) {
    AppShellRoutes.home => LocaleKeys.navigation_home.tr(),
    AppShellRoutes.profile => LocaleKeys.navigation_profile.tr(),
  };
}
