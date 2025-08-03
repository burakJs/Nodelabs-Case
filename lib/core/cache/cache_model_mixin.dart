import 'package:hive_ce/hive.dart';

mixin CacheModelMixin<T> {
  T get model;

  bool get _isOpen => Hive.isBoxOpen(T.toString());

  Future<Box<T>> get _box async {
    if (!_isOpen) {
      return Hive.openBox<T>(T.toString());
    }
    return Hive.box<T>(T.toString());
  }

  Future<void> save() async {
    final box = await _box;
    await box.put(T.toString(), model);
    box.close();
  }

  Future<T?> get() async {
    final box = await _box;
    T? result = box.get(T.toString());
    box.close();
    return result;
  }

  Future<void> delete() async {
    final box = await _box;
    await box.delete(T.toString());
    box.close();
  }

  Future<void> clear() async {
    final box = await _box;
    await box.clear();
    box.close();
  }
}
