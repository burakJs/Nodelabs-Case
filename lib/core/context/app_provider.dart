import 'package:flutter/material.dart';
import 'package:nodelabs_case/core/context/app_context.dart';
import 'package:nodelabs_case/core/context/user_context.dart';
import 'package:provider/provider.dart';

final class AppProvider {
  const AppProvider._();
  static List<InheritedProvider<ChangeNotifier>> items() {
    return [
      ListenableProvider<AppContext>(create: (_) => AppContext()),
      ListenableProvider<UserContext>(create: (_) => UserContext()),
    ];
  }
}
