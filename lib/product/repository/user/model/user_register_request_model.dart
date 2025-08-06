import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user_register_request_model.g.dart';

@JsonSerializable()
final class UserRegisterRequestModel
    extends INetworkModel<UserRegisterRequestModel> {
  const UserRegisterRequestModel({
    required this.email,
    required this.name,
    required this.password,
  });

  final String email;
  final String name;
  final String password;

  factory UserRegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterRequestModelFromJson(json);

  @override
  UserRegisterRequestModel fromJson(Map<String, dynamic> json) {
    return UserRegisterRequestModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$UserRegisterRequestModelToJson(this);
  }
}
