import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';
import 'package:nodelabs_case/product/generated/assets.gen.dart';
import 'package:nodelabs_case/product/generated/locale_keys.g.dart';
import 'package:nodelabs_case/product/widget/bottom_sheet/limited_offer_bottom_sheet.dart';

final class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.showLimitedOffer = false,
  });

  final String title;
  final bool showBackButton;
  final bool showLimitedOffer;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      automaticallyImplyLeading: false,
      leadingWidth: 68,
      leading: showBackButton
          ? UnconstrainedBox(
              child: GestureDetector(
                onTap: context.pop,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: context.general.colorScheme.onPrimary.withValues(
                        alpha: 0.2,
                      ),
                    ),
                    color: context.general.colorScheme.onPrimary.withValues(
                      alpha: 0.1,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.arrow_back_rounded, size: 24),
                ),
              ),
            )
          : null,
      actions: [
        if (showLimitedOffer)
          GestureDetector(
            onTap: () => LimitedOfferBottomSheet.show(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: context.general.colorScheme.primary,
                borderRadius: BorderRadius.circular(53),
              ),
              child: Row(
                spacing: 4,
                children: [
                  Assets.svg.diamond.svg(),
                  Text(
                    LocaleKeys.common_limited_offer.tr(),
                    style: context.general.textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
