import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nodelabs_case/product/network/service_manager.dart';
import 'package:nodelabs_case/product/repository/movies/base_movies_repository.dart';
import 'package:nodelabs_case/product/repository/movies/movies_repository.dart';
import 'package:nodelabs_case/product/repository/user/base_user_repository.dart';
import 'package:nodelabs_case/product/repository/user/user_repository.dart';

@immutable
final class AppDependency {
  const AppDependency._();

  static final GetIt _getIt = GetIt.instance;

  static Future<void> init() async {
    final serviceManager = _getIt.registerSingleton<ServiceManager>(
      ServiceManager(),
    );
    _getIt.registerSingleton<BaseUserRepository>(
      UserRepository(serviceManager: serviceManager),
    );
    _getIt.registerSingleton<BaseMoviesRepository>(
      MoviesRepository(serviceManager: serviceManager),
    );
  }

  static T get<T extends Object>() => _getIt<T>();
}
