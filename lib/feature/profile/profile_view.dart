import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:nodelabs_case/core/context/user_context.dart';
import 'package:nodelabs_case/core/localization/localization_enum.dart';
import 'package:nodelabs_case/core/utils/padding/app_padding.dart';
import 'package:nodelabs_case/core/utils/sized_box/app_sized_box.dart';
import 'package:nodelabs_case/feature/profile/view_model/profile_view_model.dart';
import 'package:nodelabs_case/product/generated/locale_keys.g.dart';
import 'package:nodelabs_case/product/model/movie_model.dart';
import 'package:nodelabs_case/product/widget/appbar/app_appbar.dart';
import 'package:nodelabs_case/product/widget/button/primary_button.dart';
import 'package:nodelabs_case/product/widget/image/app_image.dart';
import 'package:nodelabs_case/product/widget/text/text_widgets.dart';
import 'package:provider/provider.dart';

final class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

final class _ProfileViewState extends State<ProfileView> with ProfileViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: LocaleKeys.profile_title.tr(),
        showBackButton: false,
        showLimitedOffer: true,
      ),
      body: Padding(
        padding: AppPadding.allXHigh(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSizedBox.heightLow(),
            Row(
              children: [
                Consumer<UserContext>(
                  builder: (context, userContext, child) {
                    final imageUrl = userContext.user?.photoUrl ?? '';
                    if (imageUrl.isEmpty) {
                      return CircleAvatar(
                        radius: 28,
                        backgroundColor: context.general.colorScheme.primary,
                        child: PrimarySemiBoldLargeText(
                          userContext.user?.firstLetter ?? '',
                        ),
                      );
                    }
                    return CircleAvatar(
                      radius: 28,
                      backgroundImage: CachedNetworkImageProvider(imageUrl),
                    );
                  },
                ),
                AppSizedBox.widthLow(),
                Expanded(
                  child: Consumer<UserContext>(
                    builder: (context, userContext, child) {
                      return Column(
                        spacing: 4,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PrimaryMediumNormalText(userContext.user?.name ?? ''),
                          PrimaryRegularVerySmallText(
                            userContext.user?.id ?? '',
                            color: context.general.colorScheme.onPrimary
                                .withValues(alpha: 0.5),
                          ),
                        ],
                      );
                    },
                  ),
                ),

                PrimaryButton(
                  onPressed: onUploadPhotoTap,
                  text: LocaleKeys.profile_add_photo.tr(),
                  isSmall: true,
                ),
              ],
            ),
            AppSizedBox.heightExtraHigh(),
            AppSizedBox.heightLow(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: PrimaryMediumNormalText(LocaleKeys.profile_language.tr()),
              trailing: Container(
                decoration: BoxDecoration(
                  color: context.general.colorScheme.primary.withValues(
                    alpha: 0.1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        LocalizationEnum.en.changeLocale(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: context.locale == LocalizationEnum.en.locale
                              ? context.general.colorScheme.primary
                              : Colors.transparent,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        child: Text(
                          'EN',
                          style: TextStyle(
                            color: context.locale == LocalizationEnum.en.locale
                                ? Colors.white
                                : context.general.colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        LocalizationEnum.tr.changeLocale(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: context.locale == LocalizationEnum.tr.locale
                              ? context.general.colorScheme.primary
                              : Colors.transparent,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Text(
                          'TR',
                          style: TextStyle(
                            color: context.locale == LocalizationEnum.tr.locale
                                ? Colors.white
                                : context.general.colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AppSizedBox.heightLow(),
            PrimaryBoldSmallText(LocaleKeys.profile_favorite_movies.tr()),
            AppSizedBox.heightExtraHigh(),
            Expanded(
              child: Consumer<UserContext>(
                builder: (context, userContext, child) {
                  final favorites = userContext.favorites;
                  return GridView.builder(
                    itemCount: favorites.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      mainAxisSpacing: 17,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      final favorite = favorites[index];
                      return _FavoriteMovieCard(favorite: favorite);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoriteMovieCard extends StatelessWidget {
  const _FavoriteMovieCard({required this.favorite});

  final MovieModel favorite;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: AppImage(
            imageUrl: favorite.poster ?? '',
            fit: BoxFit.cover,
            width: context.sized.width,
            borderRadius: 16,
          ),
        ),
        AppSizedBox.heightHigh(),
        PrimaryMediumVerySmallText(favorite.title ?? ''),
        PrimaryRegularVerySmallText(
          favorite.director ?? '',
          color: context.general.colorScheme.onPrimary.withValues(alpha: 0.5),
        ),
      ],
    );
  }
}
