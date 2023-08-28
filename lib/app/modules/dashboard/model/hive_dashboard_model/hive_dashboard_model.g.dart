// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_dashboard_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveDashboardModelAdapter extends TypeAdapter<HiveDashboardModel> {
  @override
  final int typeId = 0;

  @override
  HiveDashboardModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveDashboardModel(
      question: fields[1] as String,
      response: fields[2] as String,
      index: fields[0] as int,
      date: fields[3] as String,
      time: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveDashboardModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.index)
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
      other is HiveDashboardModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
