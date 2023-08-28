// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_save_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveSaveModelAdapter extends TypeAdapter<HiveSaveModel> {
  @override
  final int typeId = 2;

  @override
  HiveSaveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveSaveModel(
      question: fields[1] as String,
      response: fields[2] as String,
      date: fields[3] as String,
      time: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveSaveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.question)
      ..writeByte(2)
      ..write(obj.response)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveSaveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
