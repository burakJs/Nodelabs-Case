import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nodelabs_case/core/app/app_initalize.dart';
import 'package:nodelabs_case/core/app/app_initalize_widget.dart';
import 'package:nodelabs_case/core/context/app_context.dart';
import 'package:nodelabs_case/core/router/app_router.dart';
import 'package:nodelabs_case/core/theme/dark_theme_data.dart';
import 'package:nodelabs_case/core/theme/light_theme_data.dart';
import 'package:provider/provider.dart';

void main() async {
  await AppInitialize().init();
  runApp(const AppInitializeWidget(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "SinFlix",
      scaffoldMessengerKey: context.read<AppContext>().scaffoldKey,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: LightThemeData.instance.theme,
      darkTheme: DarkThemeData.instance.theme,
      themeMode: context.watch<AppContext>().theme,
      routerConfig: AppRouter.router,
    );
  }
}
