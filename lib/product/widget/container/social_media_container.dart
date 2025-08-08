import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:nodelabs_case/core/utils/border_radius/app_border_radius.dart';
import 'package:nodelabs_case/core/utils/padding/app_padding.dart';
import 'package:nodelabs_case/product/enum/social_media_enum.dart';

final class SocialMediaContainer extends StatelessWidget {
  const SocialMediaContainer({super.key, required this.socialMedia});

  final SocialMediaEnum socialMedia;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.allXHigh() + AppPadding.allLow(),
      decoration: BoxDecoration(
        color: context.general.colorScheme.onPrimary.withValues(alpha: 0.1),
        borderRadius: AppBorderRadius.allVeryLarge(),
        border: Border.all(
          color: context.general.colorScheme.onPrimary.withValues(alpha: 0.2),
        ),
      ),
      child: SizedBox(
        width: 20,
        height: 20,
        child: socialMedia.icon.svg(fit: BoxFit.contain),
      ),
    );
  }
}
