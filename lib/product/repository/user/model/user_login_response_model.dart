import 'package:json_annotation/json_annotation.dart';
import 'package:nodelabs_case/product/model/user_model.dart';
import 'package:vexana/vexana.dart';

part 'user_login_response_model.g.dart';

@JsonSerializable()
final class UserLoginResponseModel
    extends INetworkModel<UserLoginResponseModel> {
  const UserLoginResponseModel({this.data});

  final UserModel? data;

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
