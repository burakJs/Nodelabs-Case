import 'package:json_annotation/json_annotation.dart';
import 'package:nodelabs_case/product/model/user_model.dart';
import 'package:nodelabs_case/product/network/base_response_mixin.dart';
import 'package:nodelabs_case/product/network/model/base_error_model.dart';
import 'package:vexana/vexana.dart';

part 'user_upload_photo_response_model.g.dart';

@JsonSerializable()
final class UserUploadPhotoResponseModel
    extends INetworkModel<UserUploadPhotoResponseModel>
    with BaseResponseMixin<UserModel> {
  const UserUploadPhotoResponseModel({this.data, this.error});

  @override
  final UserModel? data;
  @override
  final BaseErrorModel? error;

  factory UserUploadPhotoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserUploadPhotoResponseModelFromJson(json);

  @override
  UserUploadPhotoResponseModel fromJson(Map<String, dynamic> json) {
    return UserUploadPhotoResponseModel.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$UserUploadPhotoResponseModelToJson(this);
  }
}
