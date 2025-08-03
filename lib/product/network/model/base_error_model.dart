import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'base_error_model.g.dart';

@JsonSerializable()
final class BaseErrorModel extends INetworkModel<BaseErrorModel> {
  final BaseErrorDataModel response;

  const BaseErrorModel({required this.response});

  factory BaseErrorModel.fromJson(Map<String, dynamic> json) =>
      _$BaseErrorModelFromJson(json);

  @override
  BaseErrorModel fromJson(Map<String, dynamic> json) {
    return _$BaseErrorModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$BaseErrorModelToJson(this);
  }
}

@JsonSerializable()
final class BaseErrorDataModel extends INetworkModel<BaseErrorDataModel> {
  final int code;
  final String message;

  const BaseErrorDataModel({required this.code, required this.message});

  factory BaseErrorDataModel.fromJson(Map<String, dynamic> json) =>
      _$BaseErrorDataModelFromJson(json);

  @override
  BaseErrorDataModel fromJson(Map<String, dynamic> json) {
    return _$BaseErrorDataModelFromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$BaseErrorDataModelToJson(this);
  }
}
