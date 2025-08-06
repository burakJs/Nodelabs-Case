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
    final error = response?.error;
    if (error == null) return response?.data;
    return null;
  }

  Future<UserModel?> getProfile() async {
    final response = await _userRepository.getProfile();
    final error = response?.error;
    if (error == null) return response?.data;
    return null;
  }

  void addAuthorization(String token) {
    _serviceManager.addAuthorization(token);
  }

  void removeAuthorization() {
    _serviceManager.removeAuthorization();
  }
}
