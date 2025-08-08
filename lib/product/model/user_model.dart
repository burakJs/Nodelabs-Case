import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user_model.g.dart';

@JsonSerializable()
final class UserModel extends INetworkModel<UserModel> {
  const UserModel({this.id, this.name, this.email, this.photoUrl, this.token});

  final String? id;
  final String? name;
  final String? email;
  final String? photoUrl;
  final String? token;

  String get firstLetter => name?.substring(0, 1) ?? '';

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  UserModel fromJson(Map<String, dynamic> json) {
    return UserModel.fromJson(json);
  }
}
