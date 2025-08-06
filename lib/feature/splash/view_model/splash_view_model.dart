import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nodelabs_case/core/cache/model/user_model.dart';
import 'package:nodelabs_case/core/router/app_routes.dart';
import 'package:nodelabs_case/core/router/app_shell_routes.dart';
import 'package:nodelabs_case/feature/splash/cubit/splash_cubit.dart';
import 'package:nodelabs_case/feature/splash/splash_view.dart';
import 'package:nodelabs_case/product/extension/context_extension.dart';

mixin SplashViewModel on State<SplashView> {
  final SplashCubit _splashCubit = SplashCubit();
  SplashCubit get splashCubit => _splashCubit;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final userModel = await UserCacheModel().get();
    if (!mounted) return;
    final token = kDebugMode
        ? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2N2JjOGQ1OGQ5ZWM0ZDQwMDQwYjgxYjYiLCJpZCI6IjY3YmM4ZDU4ZDllYzRkNDAwNDBiODFiNiIsIm5hbWUiOiJzYWZhIiwiaWF0IjoxNzU0NTAyODQzLCJleHAiOjQ4NjQ5MDI4NDN9.we4xbmtfR031-63BGsOuCDCV4jv_CgUXkegBTsj5GLw'
        : userModel?.token;
    if (token == null) {
      context.replace(AppRoutes.login.path);
      return;
    }
    _splashCubit.addAuthorization(token);
    final profile = await _splashCubit.getProfile();
    if (profile == null) {
      _splashCubit.removeAuthorization();
      await UserCacheModel().delete();
      if (!mounted) return;
      context.replace(AppRoutes.login.path);
      return;
    }
    if (!mounted) return;
    context.userContext.updateUser(profile);
    final favorites = await _splashCubit.getFavorites();
    if (!mounted) return;
    context.userContext.updateFavorites(favorites ?? []);
    context.replace(AppShellRoutes.home.path);
  }
}
