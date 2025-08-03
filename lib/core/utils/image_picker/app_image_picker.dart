import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:nodelabs_case/core/utils/image_picker/image_quality_enum.dart';

final class AppImagePicker {
  Future<File?> pickImage({
    ImageQualityEnum imageQuality = ImageQualityEnum.extraLow,
  }) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: imageQuality.value,
    );
    if (pickedFile == null) return null;
    return File(pickedFile.path);
  }

  Future<List<File>?> pickImageList({
    ImageQualityEnum imageQuality = ImageQualityEnum.extraLow,
  }) async {
    final pickedFiles = await ImagePicker().pickMultiImage(
      imageQuality: imageQuality.value,
    );
    if (pickedFiles.isEmpty) return null;
    return pickedFiles.map((pickedFile) => File(pickedFile.path)).toList();
  }
}
