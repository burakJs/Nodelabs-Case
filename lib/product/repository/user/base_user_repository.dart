import 'package:nodelabs_case/product/network/app_response_type.dart';
import 'package:nodelabs_case/product/network/service_manager.dart';
import 'package:nodelabs_case/product/repository/user/model/user_login_request_model.dart';
import 'package:nodelabs_case/product/repository/user/model/user_login_response_model.dart';
import 'package:nodelabs_case/product/repository/user/model/user_profile_response_model.dart';
import 'package:nodelabs_case/product/repository/user/model/user_register_request_model.dart';
import 'package:nodelabs_case/product/repository/user/model/user_register_response_model.dart';
import 'package:nodelabs_case/product/repository/user/model/user_upload_photo_request_model.dart';
import 'package:nodelabs_case/product/repository/user/model/user_upload_photo_response_model.dart';

abstract class BaseUserRepository {
  BaseUserRepository({required this.serviceManager});
  final ServiceManager serviceManager;

  Future<AppResponseType<UserLoginResponseModel>?> login(UserLoginRequestModel requestModel);
  Future<AppResponseType<UserRegisterResponseModel>?> register(
    UserRegisterRequestModel requestModel,
  );
  Future<AppResponseType<UserUploadPhotoResponseModel>?> uploadPhoto(
    UserUploadPhotoRequestModel requestModel,
  );
  Future<AppResponseType<UserProfileResponseModel>?> getProfile();
}
