import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_case/core/context/app_context.dart';
import 'package:nodelabs_case/core/context/user_context.dart';
import 'package:nodelabs_case/product/widget/snackbar/app_snackbar.dart';

extension GlobalKeyContextExtension on BuildContext {
  GlobalKey<ScaffoldMessengerState> get _scaffoldMessengerKey =>
      appContext.scaffoldKey;

  void showErrorSnackBar({required String message}) {
    _scaffoldMessengerKey.currentState?.showSnackBar(
      AppSnackBar.error(context: this, message: message),
    );
  }

  void showSuccessSnackBar({required String message}) {
    _scaffoldMessengerKey.currentState?.showSnackBar(
      AppSnackBar.success(context: this, message: message),
    );
  }
}

extension AppContextExtension on BuildContext {
  UserContext get userContext => read<UserContext>();
  UserContext get userContextWatch => watch<UserContext>();
  AppContext get appContext => read<AppContext>();
  AppContext get appContextWatch => watch<AppContext>();
}
