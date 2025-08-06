// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginResponseModel _$UserLoginResponseModelFromJson(
  Map<String, dynamic> json,
) => UserLoginResponseModel(
  data: json['data'] == null
      ? null
      : UserModel.fromJson(json['data'] as Map<String, dynamic>),
  error: json['error'] == null
      ? null
      : BaseErrorModel.fromJson(json['error'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserLoginResponseModelToJson(
  UserLoginResponseModel instance,
) => <String, dynamic>{'data': instance.data, 'error': instance.error};
