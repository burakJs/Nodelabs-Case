// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRegisterRequestModel _$UserRegisterRequestModelFromJson(
  Map<String, dynamic> json,
) => UserRegisterRequestModel(
  email: json['email'] as String,
  name: json['name'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$UserRegisterRequestModelToJson(
  UserRegisterRequestModel instance,
) => <String, dynamic>{
  'email': instance.email,
  'name': instance.name,
  'password': instance.password,
};
