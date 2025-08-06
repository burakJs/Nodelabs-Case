// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_upload_photo_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUploadPhotoResponseModel _$UserUploadPhotoResponseModelFromJson(
  Map<String, dynamic> json,
) => UserUploadPhotoResponseModel(
  data: json['data'] == null
      ? null
      : UserModel.fromJson(json['data'] as Map<String, dynamic>),
  error: json['error'] == null
      ? null
      : BaseErrorModel.fromJson(json['error'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserUploadPhotoResponseModelToJson(
  UserUploadPhotoResponseModel instance,
) => <String, dynamic>{'data': instance.data, 'error': instance.error};
