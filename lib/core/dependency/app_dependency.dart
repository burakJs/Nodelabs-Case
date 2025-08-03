import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

@immutable
final class AppDependency {
  const AppDependency._();

  static final GetIt _getIt = GetIt.instance;

  static Future<void> init() async {
    // final serviceManager = _getIt.registerSingleton<ServiceManager>(
    //   ServiceManager(),
    // );
  }

  static T get<T extends Object>() => _getIt<T>();
}
