import 'package:nodelabs_case/core/cache/cache_model_mixin.dart';

final class TestModel with CacheModelMixin<TestModel> {
  TestModel({required this.name});
  final String name;

  @override
  TestModel get model => this;
}
