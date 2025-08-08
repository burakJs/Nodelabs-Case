// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileResponseModel _$UserProfileResponseModelFromJson(
  Map<String, dynamic> json,
) => UserProfileResponseModel(
  data: json['data'] == null
      ? null
      : UserModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserProfileResponseModelToJson(
  UserProfileResponseModel instance,
) => <String, dynamic>{'data': instance.data};
