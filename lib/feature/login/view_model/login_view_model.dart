import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nodelabs_case/core/router/app_routes.dart';
import 'package:nodelabs_case/core/router/app_shell_routes.dart';
import 'package:nodelabs_case/feature/login/cubit/login_cubit.dart';
import 'package:nodelabs_case/feature/login/login_view.dart';
import 'package:nodelabs_case/product/extension/context_extension.dart';
import 'package:nodelabs_case/product/repository/user/model/user_login_request_model.dart';

mixin LoginViewModel on State<LoginView> {
  final LoginCubit loginCubit = LoginCubit();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (!kDebugMode) return;
    emailController.text = 'burak@test.com';
    passwordController.text = '123456';
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }

  UserLoginRequestModel get loginRequestModel => UserLoginRequestModel(
    email: emailController.text.trim(),
    password: passwordController.text.trim(),
  );

  Future<void> handleLogin() async {
    final isValid = formKey.currentState?.validate();
    if (isValid == false) return;
    final result = await loginCubit.login(loginRequestModel);
    if (result == null) return;
    if (!mounted) return;
    context.userContext.updateUser(result);
    final favorites = await loginCubit.getFavorites();
    if (!mounted) return;
    context.userContext.updateFavorites(favorites ?? []);
    context.replace(AppShellRoutes.home.path);
  }

  void onRegisterTap() {
    context.replace(AppRoutes.register.path);
  }
}
