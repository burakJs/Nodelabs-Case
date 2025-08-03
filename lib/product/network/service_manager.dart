import 'dart:io';

import 'package:nodelabs_case/core/utils/enum/app_env_enum.dart';
import 'package:vexana/vexana.dart';

final class ServiceManager {
  ServiceManager() {
    manager = _baseNetworkManager();
  }

  // TODO: replace EmptyModel with BaseErrorModel
  late final INetworkManager<EmptyModel> manager;

  String get baseUrl => AppEnvEnum.baseUrl.read;

  NetworkManager<EmptyModel> _baseNetworkManager() =>
      NetworkManager<EmptyModel>(
        errorModel: null,
        interceptor: _CustomInterceptor(),
        options: BaseOptions(
          baseUrl: baseUrl,
          contentType: ContentType.json.value,
        ),
        onRefreshFail: () async {
          // removeAuthorization();
          // AppDependency.get<UserContext>().logout();
          // await AppRouter.router.push(AppRoutes.login.path);
        },
        onRefreshToken: (error, newService) async {
          return error;
        },
      );

  void addAuthorization(String token) {
    final tokenMap = MapEntry('Authorization', 'Bearer $token');
    manager.addBaseHeader(tokenMap);
    print('📣 Add Token ${manager.allHeaders}');
  }

  void removeAuthorization() {
    manager.removeHeader('Authorization');
  }
}

final class _CustomInterceptor extends Interceptor {
  @override
  void onResponse(Response<void> response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    print('📗 ${response.requestOptions.uri} ${response.statusCode}');
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    print(
      '📕 ${err.requestOptions.uri} ${err.response?.statusCode} ${err.type.name}',
    );
  }
}
