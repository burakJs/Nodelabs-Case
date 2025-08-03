// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseErrorModel _$BaseErrorModelFromJson(Map<String, dynamic> json) =>
    BaseErrorModel(
      response: BaseErrorDataModel.fromJson(
        json['response'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$BaseErrorModelToJson(BaseErrorModel instance) =>
    <String, dynamic>{'response': instance.response};

BaseErrorDataModel _$BaseErrorDataModelFromJson(Map<String, dynamic> json) =>
    BaseErrorDataModel(
      code: (json['code'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$BaseErrorDataModelToJson(BaseErrorDataModel instance) =>
    <String, dynamic>{'code': instance.code, 'message': instance.message};
