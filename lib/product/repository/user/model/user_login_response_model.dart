import 'package:json_annotation/json_annotation.dart';
import 'package:nodelabs_case/product/model/user_model.dart';
import 'package:nodelabs_case/product/network/base_response_mixin.dart';
import 'package:nodelabs_case/product/network/model/base_error_model.dart';
import 'package:vexana/vexana.dart';

part 'user_login_response_model.g.dart';

@JsonSerializable()
final class UserLoginResponseModel extends INetworkModel<UserLoginResponseModel>
    with BaseResponseMixin<UserModel> {
  const UserLoginResponseModel({this.data, this.error});

  @override
  final UserModel? data;
  @override
  final BaseErrorModel? error;

  factory UserLoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserLoginResponseModelFromJson(json);

  @override
  UserLoginResponseModel fromJson(Map<String, dynamic> json) {
    return UserLoginResponseModel.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$UserLoginResponseModelToJson(this);
  }
}
