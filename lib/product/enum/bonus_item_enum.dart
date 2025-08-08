import 'package:easy_localization/easy_localization.dart';
import 'package:nodelabs_case/product/generated/assets.gen.dart';
import 'package:nodelabs_case/product/generated/locale_keys.g.dart';

enum BonusItemEnum {
  premiumAccount,
  moreMatching,
  highlights,
  moreLike;

  SvgGenImage get icon => switch (this) {
    premiumAccount => Assets.svg.premiumAccount,
    moreMatching => Assets.svg.moreMatching,
    highlights => Assets.svg.highlights,
    moreLike => Assets.svg.moreLike,
  };

  AssetGenImage get iconPng => switch (this) {
    premiumAccount => Assets.png.premiumAccount,
    moreMatching => Assets.png.moreMatching,
    highlights => Assets.png.highlights,
    moreLike => Assets.png.moreLike,
  };

  String get title => switch (this) {
    premiumAccount => LocaleKeys.bonus_items_premium_account.tr(),
    moreMatching => LocaleKeys.bonus_items_more_matching.tr(),
    highlights => LocaleKeys.bonus_items_highlights.tr(),
    moreLike => LocaleKeys.bonus_items_more_like.tr(),
  };
}
