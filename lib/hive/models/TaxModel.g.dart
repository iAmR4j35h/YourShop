// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TaxModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaxModelAdapter extends TypeAdapter<TaxModel> {
  @override
  final int typeId = 4;

  @override
  TaxModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaxModel(
      fields[1] as String,
      fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, TaxModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaxModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
