// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_login_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveLoginModelAdapter extends TypeAdapter<HiveLoginModel> {
  @override
  final int typeId = 1;

  @override
  HiveLoginModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveLoginModel(
      email: fields[1] as String,
      name: fields[0] as String,
      password: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveLoginModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveLoginModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
