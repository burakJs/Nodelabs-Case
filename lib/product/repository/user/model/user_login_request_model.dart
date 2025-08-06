import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user_login_request_model.g.dart';

@JsonSerializable()
final class UserLoginRequestModel extends INetworkModel<UserLoginRequestModel> {
  const UserLoginRequestModel({required this.email, required this.password});

  final String email;
  final String password;

  factory UserLoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UserLoginRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserLoginRequestModelToJson(this);

  @override
  UserLoginRequestModel fromJson(Map<String, dynamic> json) {
    return UserLoginRequestModel.fromJson(json);
  }
}
