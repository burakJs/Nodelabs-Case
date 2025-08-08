import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nodelabs_case/core/utils/image_picker/app_image_picker.dart';
import 'package:nodelabs_case/feature/upload_photo/cubit/upload_photo_cubit.dart';
import 'package:nodelabs_case/feature/upload_photo/upload_photo_view.dart';
import 'package:nodelabs_case/product/extension/context_extension.dart';
import 'package:nodelabs_case/product/repository/user/model/user_upload_photo_request_model.dart';

mixin UploadPhotoViewModel on State<UploadPhotoView> {
  final UploadPhotoCubit _uploadPhotoCubit = UploadPhotoCubit();
  final AppImagePicker _imagePicker = AppImagePicker();
  final ValueNotifier<File?> selectedImage = ValueNotifier<File?>(null);

  UploadPhotoCubit get uploadPhotoCubit => _uploadPhotoCubit;

  @override
  void dispose() {
    selectedImage.dispose();
    super.dispose();
  }

  Future<void> pickImage() async {
    final image = await _imagePicker.pickImage();
    selectedImage.value = image;
  }

  Future<void> handleUploadPhoto() async {
    if (selectedImage.value == null) return;

    final requestModel = UserUploadPhotoRequestModel(
      file: selectedImage.value!,
    );

    final result = await _uploadPhotoCubit.uploadPhoto(requestModel);
    if (result == null) return;
    if (!mounted) return;
    context.userContext.updateUser(result);
    context.pop();
  }
}
