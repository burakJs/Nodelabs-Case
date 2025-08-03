import 'package:flutter/material.dart';

final class AppInitialize {
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(
    //   !kDebugMode,
    // );
    // await EasyLocalization.ensureInitialized();
    // await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // await AppCache(cacheInitialize: HiveCacheInitialize()).init();
    // await const AppDependency().init();
    // await DeepLinkInitialize().init();
  }
}
