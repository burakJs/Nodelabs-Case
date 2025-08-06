// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapter.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class UserCacheModelAdapter extends TypeAdapter<UserCacheModel> {
  @override
  final typeId = 2;

  @override
  UserCacheModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserCacheModel(token: fields[0] as String?);
  }

  @override
  void write(BinaryWriter writer, UserCacheModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCacheModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
