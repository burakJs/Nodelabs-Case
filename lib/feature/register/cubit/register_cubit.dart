import 'package:easy_localization/easy_localization.dart';
import 'package:nodelabs_case/core/cache/model/user_model.dart';
import 'package:nodelabs_case/core/cubit/base_cubit.dart';
import 'package:nodelabs_case/core/dependency/app_dependency.dart';
import 'package:nodelabs_case/product/generated/locale_keys.g.dart';
import 'package:nodelabs_case/product/model/user_model.dart';
import 'package:nodelabs_case/product/network/base_response_extension.dart';
import 'package:nodelabs_case/product/repository/user/base_user_repository.dart';
import 'package:nodelabs_case/product/repository/user/model/user_register_request_model.dart';

import 'register_state.dart';

final class RegisterCubit extends BaseCubit<RegisterState> {
  RegisterCubit()
    : _userRepository = AppDependency.get<BaseUserRepository>(),
      super(const RegisterState());

  final BaseUserRepository _userRepository;

  void toggleTermsAccepted() {
    safeEmit(state.copyWith(isTermsAccepted: !state.isTermsAccepted));
  }

  Future<UserModel?> register(UserRegisterRequestModel model) async {
    if (!state.isTermsAccepted) {
      safeEmit(
        state.copyWith(
          errorMessage: LocaleKeys.register_accept_terms_error.tr(),
          hasError: true,
        ),
      );
      return null;
    }

    safeEmit(state.copyWith(isLoading: true));
    final result = await _userRepository.register(model);
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
    final token = result?.data?.data?.token;
    if (token == null) {
      safeEmit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Token bulunamadı',
          hasError: true,
        ),
      );
      return null;
    }
    await UserCacheModel(token: token).save();
    safeEmit(state.copyWith(isLoading: false));
    return result?.data?.data;
  }
}
