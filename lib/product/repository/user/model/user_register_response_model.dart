import 'package:json_annotation/json_annotation.dart';
import 'package:nodelabs_case/product/model/user_model.dart';
import 'package:vexana/vexana.dart';

part 'user_register_response_model.g.dart';

@JsonSerializable()
final class UserRegisterResponseModel
    extends INetworkModel<UserRegisterResponseModel> {
  const UserRegisterResponseModel({this.data});

  final UserModel? data;

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
