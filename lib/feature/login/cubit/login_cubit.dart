import 'package:nodelabs_case/core/cache/model/user_model.dart';
import 'package:nodelabs_case/core/cubit/base_cubit.dart';
import 'package:nodelabs_case/core/dependency/app_dependency.dart';
import 'package:nodelabs_case/product/model/movie_model.dart';
import 'package:nodelabs_case/product/model/user_model.dart';
import 'package:nodelabs_case/product/network/base_response_extension.dart';
import 'package:nodelabs_case/product/network/service_manager.dart';
import 'package:nodelabs_case/product/repository/movies/base_movies_repository.dart';
import 'package:nodelabs_case/product/repository/user/base_user_repository.dart';
import 'package:nodelabs_case/product/repository/user/model/user_login_request_model.dart';

import 'login_state.dart';

final class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit()
    : _userRepository = AppDependency.get<BaseUserRepository>(),
      _moviesRepository = AppDependency.get<BaseMoviesRepository>(),
      _serviceManager = AppDependency.get<ServiceManager>(),
      super(const LoginState());

  final BaseUserRepository _userRepository;
  final BaseMoviesRepository _moviesRepository;
  final ServiceManager _serviceManager;

  Future<UserModel?> login(UserLoginRequestModel model) async {
    safeEmit(state.copyWith(isLoading: true));
    final result = await _userRepository.login(model);
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
    _serviceManager.addAuthorization(token);
    safeEmit(state.copyWith(isLoading: false));
    return result?.data?.data;
  }

  Future<List<MovieModel>?> getFavorites() async {
    final response = await _moviesRepository.getFavorites();
    if (response?.error != null) return null;
    return response?.data?.data;
  }
}
