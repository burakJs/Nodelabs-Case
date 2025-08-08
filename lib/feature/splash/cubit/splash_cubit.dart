import 'package:nodelabs_case/core/cubit/base_cubit.dart';
import 'package:nodelabs_case/core/dependency/app_dependency.dart';
import 'package:nodelabs_case/product/model/movie_model.dart';
import 'package:nodelabs_case/product/model/user_model.dart';
import 'package:nodelabs_case/product/network/service_manager.dart';
import 'package:nodelabs_case/product/repository/movies/base_movies_repository.dart';
import 'package:nodelabs_case/product/repository/user/base_user_repository.dart';

final class SplashCubit extends BaseCubit<void> {
  SplashCubit()
    : _userRepository = AppDependency.get<BaseUserRepository>(),
      _moviesRepository = AppDependency.get<BaseMoviesRepository>(),
      _serviceManager = AppDependency.get<ServiceManager>(),
      super(null);

  final BaseUserRepository _userRepository;
  final BaseMoviesRepository _moviesRepository;
  final ServiceManager _serviceManager;

  Future<List<MovieModel>?> getFavorites() async {
    final response = await _moviesRepository.getFavorites();
    if (response?.error != null) return null;
    return response?.data?.data;
  }

  Future<UserModel?> getProfile() async {
    final response = await _userRepository.getProfile();
    if (response?.error != null) return null;
    return response?.data?.data;
  }

  void addAuthorization(String token) {
    _serviceManager.addAuthorization(token);
  }

  void removeAuthorization() {
    _serviceManager.removeAuthorization();
  }
}
