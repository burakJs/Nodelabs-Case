import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nodelabs_case/core/router/app_routes.dart';
import 'package:nodelabs_case/core/router/app_shell_routes.dart';
import 'package:nodelabs_case/feature/register/cubit/register_cubit.dart';
import 'package:nodelabs_case/feature/register/register_view.dart';
import 'package:nodelabs_case/product/extension/context_extension.dart';
import 'package:nodelabs_case/product/generated/locale_keys.g.dart';
import 'package:nodelabs_case/product/repository/user/model/user_register_request_model.dart';
import 'package:nodelabs_case/product/widget/snackbar/app_snackbar.dart';

mixin RegisterViewModel on State<RegisterView> {
  final RegisterCubit registerCubit = RegisterCubit();
  final TextEditingController nameSurnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (!kDebugMode) return;
    nameSurnameController.text = 'Test User';
    emailController.text = 'burak@test.com';
    passwordController.text = '123456';
    passwordConfirmController.text = '123456';
  }

  @override
  void dispose() {
    nameSurnameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }

  UserRegisterRequestModel get registerRequestModel => UserRegisterRequestModel(
    name: nameSurnameController.text.trim(),
    email: emailController.text.trim(),
    password: passwordController.text.trim(),
  );

  Future<void> handleRegister() async {
    final isValid = formKey.currentState?.validate();
    if (isValid == false) return;

    if (passwordController.text != passwordConfirmController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        AppSnackBar.error(
          context: context,
          message: LocaleKeys.register_password_mismatch.tr(),
        ),
      );
      return;
    }

    final result = await registerCubit.register(registerRequestModel);
    if (result == null) return;
    if (!mounted) return;
    context.userContext.updateUser(result);
    context.replace(AppShellRoutes.home.path);
  }

  void onLoginTap() {
    context.replace(AppRoutes.login.path);
  }

  void onTermsOfServiceTap() {
    // Empty method as requested
  }
}
