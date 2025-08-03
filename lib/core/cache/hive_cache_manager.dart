import 'package:hive_ce/hive.dart';
import 'package:nodelabs_case/core/cache/adapter/hive_registrar.g.dart';
import 'package:path_provider/path_provider.dart';

final class HiveCacheManager {
  static HiveCacheManager? _instance;
  HiveCacheManager._();
  static HiveCacheManager get instance => _instance ??= HiveCacheManager._();

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive
      ..init(dir.path)
      ..registerAdapters();
  }

  Future<void> close() async {
    await Hive.close();
  }
}
