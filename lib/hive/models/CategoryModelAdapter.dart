import 'package:hive/hive.dart';
import 'package:your_product/hive/models/CategoryModel.dart';
import 'package:your_product/hive/models/ProductModel.dart';
import 'package:your_product/hive/models/TaxModel.dart';
import 'package:your_product/hive/models/VariantModel.dart';

class CategoryModelAdapter extends TypeAdapter<CategoryModel> {
  @override
  final typeId = 1;

  @override
  CategoryModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryModel(
      fields[0] as int,
      fields[1] as String,
      fields[2] as List<ProductModel>,
      fields[3] as List<String>
    );
  }

  @override
  void write(BinaryWriter writer, CategoryModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.products)
      ..writeByte(3)
      ..write(obj.child_categories);
  }
}
