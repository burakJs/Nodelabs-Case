import 'package:nodelabs_case/product/repository/user/base_user_repository.dart';
import 'package:nodelabs_case/product/repository/user/enum/user_endpoint_enum.dart';
import 'package:nodelabs_case/product/repository/user/model/user_login_request_model.dart';
import 'package:nodelabs_case/product/repository/user/model/user_login_response_model.dart';
import 'package:nodelabs_case/product/repository/user/model/user_profile_response_model.dart';
import 'package:nodelabs_case/product/repository/user/model/user_register_request_model.dart';
import 'package:nodelabs_case/product/repository/user/model/user_register_response_model.dart';
import 'package:nodelabs_case/product/repository/user/model/user_upload_photo_request_model.dart';
import 'package:nodelabs_case/product/repository/user/model/user_upload_photo_response_model.dart';
import 'package:vexana/vexana.dart';

final class UserRepository extends BaseUserRepository {
  UserRepository({required super.serviceManager});

  @override
  Future<UserProfileResponseModel?> getProfile() async {
    final response = await serviceManager.manager
        .send<UserProfileResponseModel, UserProfileResponseModel>(
          UserEndpointEnum.profile.path,
          parseModel: UserProfileResponseModel(),
          method: RequestType.GET,
        );

    return response.data;
  }

  @override
  Future<UserLoginResponseModel?> login(
    UserLoginRequestModel requestModel,
  ) async {
    final response = await serviceManager.manager
        .send<UserLoginResponseModel, UserLoginResponseModel>(
          UserEndpointEnum.login.path,
          parseModel: UserLoginResponseModel(),
          method: RequestType.POST,
          data: requestModel.toJson(),
        );

    return response.data;
  }

  @override
  Future<UserRegisterResponseModel?> register(
    UserRegisterRequestModel requestModel,
  ) async {
    final response = await serviceManager.manager
        .send<UserRegisterResponseModel, UserRegisterResponseModel>(
          UserEndpointEnum.register.path,
          parseModel: UserRegisterResponseModel(),
          method: RequestType.POST,
          data: requestModel.toJson(),
        );

    return response.data;
  }

  @override
  Future<UserUploadPhotoResponseModel?> uploadPhoto(
    UserUploadPhotoRequestModel requestModel,
  ) async {
    final formData = requestModel.toFormData();
    if (formData == null) {
      return null;
    }
    final response = await serviceManager.manager
        .send<UserUploadPhotoResponseModel, UserUploadPhotoResponseModel>(
          UserEndpointEnum.uploadPhoto.path,
          parseModel: UserUploadPhotoResponseModel(),
          method: RequestType.POST,
          data: formData,
          options: Options(headers: {'Content-Type': 'multipart/form-data'}),
        );

    return response.data;
  }
}
