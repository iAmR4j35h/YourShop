// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RankingModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RankingModelAdapter extends TypeAdapter<RankingModel> {
  @override
  final int typeId = 5;

  @override
  RankingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RankingModel(
      fields[0] as String,
      (fields[1] as List)?.cast<RankingProductModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, RankingModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.ranking)
      ..writeByte(1)
      ..write(obj.products);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RankingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
