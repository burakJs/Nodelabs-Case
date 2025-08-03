import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      AppShellRoutes.home => Scaffold(body: const Center(child: Text('Home'))),
      AppShellRoutes.profile => Scaffold(
        body: const Center(child: Text('Profile')),
      ),
    };
  }

  // SvgGenImage get icon => switch (this) {
  //   AppShellRoutes.home => Assets.svg.tabSearch,
  //   AppShellRoutes.favorite => Assets.svg.tabFavorite,
  //   AppShellRoutes.myHotel => Assets.svg.tabMyHotel,
  //   AppShellRoutes.profile => Assets.svg.tabProfile,
  // };

  // SvgGenImage get activeIcon => switch (this) {
  //   AppShellRoutes.home => Assets.svg.tabSearchActive,
  //   AppShellRoutes.favorite => Assets.svg.tabFavoriteActive,
  //   AppShellRoutes.myHotel => Assets.svg.tabMyHotelActive,
  //   AppShellRoutes.profile => Assets.svg.tabProfileActive,
  // };

  // String get label => switch (this) {
  //   AppShellRoutes.home => LocaleKeys.filter_tab_search.tr(),
  //   AppShellRoutes.favorite => LocaleKeys.filter_tab_favorite.tr(),
  //   AppShellRoutes.myHotel => LocaleKeys.filter_tab_my_hotel.tr(),
  //   AppShellRoutes.profile => LocaleKeys.filter_tab_profile.tr(),
  // };
}
