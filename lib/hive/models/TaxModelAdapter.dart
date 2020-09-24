import 'package:hive/hive.dart';
import 'package:your_product/hive/models/TaxModel.dart';
import 'package:your_product/hive/models/VariantModel.dart';

class TaxModelAdapter extends TypeAdapter<TaxModel> {
  @override
  final typeId = 1;

  @override
  TaxModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaxModel(
      fields[0] as String,
      fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, TaxModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.value)
      ..writeByte(2);
}}
