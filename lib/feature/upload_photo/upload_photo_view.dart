import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:nodelabs_case/core/utils/sized_box/app_sized_box.dart';
import 'package:nodelabs_case/feature/upload_photo/cubit/upload_photo_cubit.dart';
import 'package:nodelabs_case/feature/upload_photo/cubit/upload_photo_state.dart';
import 'package:nodelabs_case/feature/upload_photo/view_model/upload_photo_view_model.dart';
import 'package:nodelabs_case/product/generated/assets.gen.dart';
import 'package:nodelabs_case/product/widget/appbar/app_appbar.dart';
import 'package:nodelabs_case/product/widget/button/primary_button.dart';
import 'package:nodelabs_case/product/widget/text/primary_regular_small_text.dart';
import 'package:nodelabs_case/product/widget/text/primary_semibold_medium_text.dart';

final class UploadPhotoView extends StatefulWidget {
  const UploadPhotoView({super.key});

  @override
  State<UploadPhotoView> createState() => _UploadPhotoViewState();
}

final class _UploadPhotoViewState extends State<UploadPhotoView>
    with UploadPhotoViewModel {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UploadPhotoCubit>(
      create: (context) => uploadPhotoCubit,
      child: BlocBuilder<UploadPhotoCubit, UploadPhotoState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppAppBar(title: 'Profil Detayı'),
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppSizedBox.heightExtraHigh(),
                      PrimarySemiBoldMediumText(
                        'Fotoğraflarınızı Yükleyin',
                        textAlign: TextAlign.center,
                      ),
                      AppSizedBox.heightLow(),
                      PrimaryRegularSmallText(
                        'Resources out incentivize relaxation floor loss cc.',
                        maxLine: 2,
                        textAlign: TextAlign.center,
                      ),
                      AppSizedBox.heightExtraHigh(),
                      AppSizedBox.heightExtraHigh(),
                      GestureDetector(
                        onTap: pickImage,
                        child: ValueListenableBuilder<File?>(
                          valueListenable: selectedImage,
                          builder: (context, image, child) {
                            return AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              child: Container(
                                key: ValueKey(image),
                                width: 170,
                                height: 170,
                                padding: image == null
                                    ? const EdgeInsets.all(40)
                                    : EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(31),
                                  border: Border.all(
                                    width: 1.55,
                                    color: context.general.colorScheme.onPrimary
                                        .withValues(alpha: 0.1),
                                  ),
                                  color: context.general.colorScheme.onPrimary
                                      .withValues(alpha: 0.1),
                                ),
                                child: image == null
                                    ? Assets.svg.plus.svg(key: ValueKey('plus'))
                                    : ClipRRect(
                                        key: ValueKey('image'),
                                        borderRadius: BorderRadius.circular(31),
                                        child: Image.file(
                                          image,
                                          width: 170,
                                          height: 170,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(26),
              child: PrimaryButton(
                onPressed: handleUploadPhoto,
                text: 'Fotoğraf Yükle',
              ),
            ),
          );
        },
      ),
    );
  }
}
