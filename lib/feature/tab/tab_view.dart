import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';
import 'package:nodelabs_case/core/router/app_shell_routes.dart';
import 'package:nodelabs_case/core/utils/border_radius/app_border_radius.dart';
import 'package:nodelabs_case/core/utils/duration/app_duration.dart';
import 'package:nodelabs_case/feature/tab/view_model/tab_view_model.dart';
import 'package:nodelabs_case/product/widget/text/text_widgets.dart';

class TabView extends StatefulWidget {
  const TabView({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with TabViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: Container(
        color: context.general.colorScheme.secondaryContainer,
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: SafeArea(
            child: Row(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              children: AppShellRoutes.values
                  .map(
                    (e) => _TabItem(
                      route: e,
                      onTap: () => onItemTapped(e.index),
                      isActive:
                          e ==
                          AppShellRoutes.values[widget
                              .navigationShell
                              .currentIndex],
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

final class _TabItem extends StatelessWidget {
  const _TabItem({
    required this.route,
    required this.isActive,
    required this.onTap,
  });

  final AppShellRoutes route;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        width: 125,
        duration: AppDuration.low(),
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          borderRadius:
              AppBorderRadius.allVeryLarge() + AppBorderRadius.allLow(),
          border: Border.all(
            color: isActive
                ? context.general.colorScheme.onPrimary
                : context.general.colorScheme.onPrimary.withValues(alpha: 0.2),
          ),
        ),
        child: Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [route.icon.svg(), PrimaryMediumVerySmallText(route.label)],
        ),
      ),
    );
  }
}
