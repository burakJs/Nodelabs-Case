import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';
import 'package:nodelabs_case/core/router/app_router.dart';
import 'package:nodelabs_case/core/theme/color/app_custom_color.dart';
import 'package:nodelabs_case/core/utils/duration/app_duration.dart';
import 'package:nodelabs_case/core/utils/sized_box/app_sized_box.dart';
import 'package:nodelabs_case/product/enum/bonus_item_enum.dart';
import 'package:nodelabs_case/product/enum/token_package_enum.dart';
import 'package:nodelabs_case/product/generated/locale_keys.g.dart';
import 'package:nodelabs_case/product/widget/button/primary_button.dart';
import 'package:nodelabs_case/product/widget/text/text_widgets.dart';

final class LimitedOfferBottomSheet extends StatefulWidget {
  const LimitedOfferBottomSheet({super.key});

  static Future<void> show(BuildContext context) {
    final globalContext = AppRouter.navigatorKey.currentContext ?? context;
    return showModalBottomSheet<void>(
      context: globalContext,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => const LimitedOfferBottomSheet(),
    );
  }

  @override
  State<LimitedOfferBottomSheet> createState() =>
      _LimitedOfferBottomSheetState();
}

class _LimitedOfferBottomSheetState extends State<LimitedOfferBottomSheet> {
  TokenPackageEnum selectedTokenPackage = TokenPackageEnum.small;

  void selectTokenPackage(TokenPackageEnum package) {
    selectedTokenPackage = package;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF090909),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -120,
            left: 40,
            child: Container(
              width: 320,
              height: 320,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFFE50914).withValues(alpha: 0.6),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -150,
            left: 40,
            child: Container(
              width: 320,
              height: 320,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFFE50914).withValues(alpha: 0.4),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PrimarySemiBoldLargeText(
                  LocaleKeys.limited_offer_title.tr(),
                  textAlign: TextAlign.center,
                ),
                const AppSizedBox.heightLow(),
                SizedBox(
                  width: context.sized.dynamicWidth(.7),
                  child: PrimaryRegularVerySmallText(
                    LocaleKeys.limited_offer_description.tr(),
                    textAlign: TextAlign.center,
                    maxLine: null,
                    overflow: TextOverflow.visible,
                  ),
                ),
                const AppSizedBox.heightExtraHigh(),
                const _BonusSection(),
                const AppSizedBox.heightExtraHigh(),

                PrimaryMediumNormalText(
                  LocaleKeys.limited_offer_select_package.tr(),
                ),
                const AppSizedBox.heightHigh(),
                _TokenPackagesSection(
                  selectedTokenPackage: selectedTokenPackage,
                  onSelectTokenPackage: selectTokenPackage,
                ),
                const AppSizedBox.heightHigh(),
                const AppSizedBox.heightLow(),
                SizedBox(
                  width: context.sized.width,
                  child: PrimaryButton(
                    onPressed: context.pop,
                    text: LocaleKeys.limited_offer_see_all_tokens.tr(),
                  ),
                ),
                const AppSizedBox.heightLow(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final class _BonusSection extends StatelessWidget {
  const _BonusSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 1.0,
          colors: [
            Colors.white.withValues(alpha: 0.1),
            Colors.white.withValues(alpha: 0.03),
          ],
        ),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          PrimaryMediumNormalText(LocaleKeys.limited_offer_bonuses_title.tr()),
          const AppSizedBox.heightExtraHigh(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: BonusItemEnum.values
                .map((bonus) => _BonusItem(bonusItem: bonus))
                .toList(),
          ),
        ],
      ),
    );
  }
}

final class _BonusItem extends StatelessWidget {
  const _BonusItem({required this.bonusItem});

  final BonusItemEnum bonusItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(11),
          decoration: BoxDecoration(
            color: AppCustomColor.primaryDark,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: context.general.colorScheme.onPrimary,
                blurRadius: 4,
                spreadRadius: -1,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: bonusItem.iconPng.image(width: 33, height: 33),
        ),
        const SizedBox(height: 8),
        PrimaryRegularVerySmallText(
          bonusItem.title,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

final class _TokenPackagesSection extends StatelessWidget {
  const _TokenPackagesSection({
    required this.selectedTokenPackage,
    required this.onSelectTokenPackage,
  });

  final TokenPackageEnum selectedTokenPackage;
  final ValueSetter<TokenPackageEnum> onSelectTokenPackage;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: TokenPackageEnum.values.map((package) {
        return Expanded(
          child: _TokenPackageItem(
            package: package,
            isSelected: package == selectedTokenPackage,
            onSelect: () => onSelectTokenPackage(package),
          ),
        );
      }).toList(),
    );
  }
}

final class _TokenPackageItem extends StatelessWidget {
  const _TokenPackageItem({
    required this.package,
    required this.isSelected,
    required this.onSelect,
  });

  final TokenPackageEnum package;
  final bool isSelected;
  final VoidCallback onSelect;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: onSelect,
          child: AnimatedContainer(
            duration: AppDuration.low(),
            margin: const EdgeInsets.only(top: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: package == TokenPackageEnum.medium
                    ? const Alignment(-0.7, -0.7)
                    : const Alignment(-0.3, -0.3),
                radius: 1.5,
                colors: package.gradientColors,
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withValues(alpha: 0.4)),
              boxShadow: [
                if (isSelected)
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.3),
                    blurRadius: 15,
                    spreadRadius: 0,
                    offset: const Offset(4, 4),
                  ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppSizedBox.heightExtraHigh(),
                PrimaryMediumNormalText(package.originalPrice),
                SecondaryBlackLargeText(package.discountedPrice),
                PrimaryMediumNormalText(LocaleKeys.limited_offer_token.tr()),
                AppSizedBox.heightExtraHigh(),
                Divider(color: Colors.white.withValues(alpha: 0.1), height: 1),
                AppSizedBox.heightMedium(),
                SecondaryBlackNormalText(package.priceText),
                PrimaryRegularVerySmallText(
                  LocaleKeys.limited_offer_per_week.tr(),
                  textAlign: TextAlign.center,
                  maxLine: null,
                  overflow: TextOverflow.visible,
                ),
              ],
            ),
          ),
        ),

        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              decoration: BoxDecoration(
                color: package.discountBadgeColor,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.3),
                    blurRadius: 4,
                    spreadRadius: -1,
                    offset: const Offset(-1, -1),
                  ),
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 4,
                    spreadRadius: -1,
                    offset: const Offset(1, 1),
                  ),
                ],
              ),
              child: PrimaryRegularVerySmallText(package.discountPercent),
            ),
          ),
        ),
      ],
    );
  }
}
