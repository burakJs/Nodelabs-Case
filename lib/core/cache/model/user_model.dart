import 'package:nodelabs_case/core/cache/cache_model_mixin.dart';

final class UserCacheModel with CacheModelMixin<UserCacheModel> {
  UserCacheModel({this.token});
  final String? token;

  @override
  UserCacheModel get model => this;
}
