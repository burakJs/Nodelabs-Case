import 'dart:io';

import 'package:vexana/vexana.dart';

final class UserUploadPhotoRequestModel
    extends INetworkModel<UserUploadPhotoRequestModel>
    with IFormDataModel<UserUploadPhotoRequestModel> {
  const UserUploadPhotoRequestModel({required this.image});

  final File image;

  @override
  UserUploadPhotoRequestModel fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson() {
    return {'file': MultipartFile.fromFileSync(image.path)};
  }
}
