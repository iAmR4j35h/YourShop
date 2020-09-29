// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VariantModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VariantModelAdapter extends TypeAdapter<VariantModel> {
  @override
  final int typeId = 2;

  @override
  VariantModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VariantModel(
      fields[0] as int,
      fields[1] as String,
      fields[2] as int,
      fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, VariantModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.color)
      ..writeByte(2)
      ..write(obj.size)
      ..writeByte(3)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VariantModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
