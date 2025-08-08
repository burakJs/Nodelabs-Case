import 'package:json_annotation/json_annotation.dart';
import 'package:nodelabs_case/product/model/user_model.dart';
import 'package:vexana/vexana.dart';

part 'user_profile_response_model.g.dart';

@JsonSerializable()
final class UserProfileResponseModel
    extends INetworkModel<UserProfileResponseModel> {
  const UserProfileResponseModel({this.data});

  final UserModel? data;

  factory UserProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResponseModelFromJson(json);

  @override
  UserProfileResponseModel fromJson(Map<String, dynamic> json) {
    return UserProfileResponseModel.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson() {
    return _$UserProfileResponseModelToJson(this);
  }
}
