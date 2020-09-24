import 'package:hive/hive.dart';
import 'package:your_product/hive/models/ProductModel.dart';

@HiveType(typeId: 1)
class CategoryModel{
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  List<ProductModel> products;
  @HiveField(3)
  List<String> child_categories;
  CategoryModel(this.id, this.name, this.products,this.child_categories);
}