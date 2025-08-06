import 'package:json_annotation/json_annotation.dart';
import 'package:nodelabs_case/product/model/user_model.dart';
import 'package:nodelabs_case/product/network/base_response_mixin.dart';
import 'package:nodelabs_case/product/network/model/base_error_model.dart';
import 'package:vexana/vexana.dart';

part 'user_register_response_model.g.dart';

@JsonSerializable()
final class UserRegisterResponseModel
    extends INetworkModel<UserRegisterResponseModel>
    with BaseResponseMixin<UserModel> {
  const UserRegisterResponseModel({this.data, this.error});

  @override
  final UserModel? data;
  @override
  final BaseErrorModel? error;

  factory UserRegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterResponseModelFromJson(json);

  @override
  UserRegisterResponseModel fromJson(Map<String, dynamic> json) {
    return UserRegisterResponseModel.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$UserRegisterResponseModelToJson(this);
  }
}
