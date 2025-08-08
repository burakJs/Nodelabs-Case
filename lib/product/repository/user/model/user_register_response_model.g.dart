// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRegisterResponseModel _$UserRegisterResponseModelFromJson(
  Map<String, dynamic> json,
) => UserRegisterResponseModel(
  data: json['data'] == null
      ? null
      : UserModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserRegisterResponseModelToJson(
  UserRegisterResponseModel instance,
) => <String, dynamic>{'data': instance.data};
