import 'package:nodelabs_case/core/cubit/base_cubit.dart';
import 'package:nodelabs_case/core/dependency/app_dependency.dart';
import 'package:nodelabs_case/feature/upload_photo/cubit/upload_photo_state.dart';
import 'package:nodelabs_case/product/model/user_model.dart';
import 'package:nodelabs_case/product/network/base_response_extension.dart';
import 'package:nodelabs_case/product/repository/user/base_user_repository.dart';
import 'package:nodelabs_case/product/repository/user/model/user_upload_photo_request_model.dart';

final class UploadPhotoCubit extends BaseCubit<UploadPhotoState> {
  UploadPhotoCubit()
    : _userRepository = AppDependency.get<BaseUserRepository>(),
      super(const UploadPhotoState());
  final BaseUserRepository _userRepository;

  Future<UserModel?> uploadPhoto(
    UserUploadPhotoRequestModel requestModel,
  ) async {
    safeEmit(state.copyWith(isLoading: true));
    final result = await _userRepository.uploadPhoto(requestModel);
    if (result.hasError) {
      safeEmit(
        state.copyWith(
          isLoading: false,
          errorMessage: result?.errorMessage,
          hasError: true,
        ),
      );
      return null;
    }
    safeEmit(state.copyWith(isLoading: false));
    return result?.data?.data;
  }
}
