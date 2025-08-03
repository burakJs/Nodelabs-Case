import 'package:nodelabs_case/core/utils/env/env_dev.dart';

final Map<AppEnvEnum, String> _devEnvironment = <AppEnvEnum, String>{
  AppEnvEnum.baseUrl: EnvDev.baseUrl,
};

enum AppEnvEnum { baseUrl }

extension DotEnvEnumsExtension on AppEnvEnum {
  String get read {
    return _devEnvironment[this]!;
    // return kDebugMode ? _devEnvironment[this]! : '';
  }
}
