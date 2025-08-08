import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'base_error_model.g.dart';

@JsonSerializable()
final class BaseErrorModel extends INetworkModel<BaseErrorModel> {
  const BaseErrorModel({this.response});
  final BaseErrorDataModel? response;

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
  const BaseErrorDataModel({this.code, this.message});

  final int? code;
  final String? message;

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
