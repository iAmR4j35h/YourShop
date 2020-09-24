import 'package:hive/hive.dart';
import 'package:your_product/hive/models/ProductModel.dart';
import 'package:your_product/hive/models/TaxModel.dart';
import 'package:your_product/hive/models/VariantModel.dart';

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final typeId = 1;

  @override
  ProductModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      fields[0] as int,
      fields[1] as String,
      fields[2] as DateTime,
      fields[3] as List<VariantModel>,
      fields[4] as TaxModel,
      fields[6] as int,
      fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.date_added)
      ..writeByte(3)
      ..write(obj.variants)
      ..writeByte(4)
      ..write(obj.tax)
      ..writeByte(5)
      ..write(obj.order_count)
      ..writeByte(6)
      ..write(obj.shares);
  }
}
