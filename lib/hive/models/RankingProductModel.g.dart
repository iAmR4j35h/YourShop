// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RankingProductModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RankingProductModelAdapter extends TypeAdapter<RankingProductModel> {
  @override
  final int typeId = 6;

  @override
  RankingProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RankingProductModel(
      fields[0] as int,
      fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, RankingProductModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RankingProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
