import 'package:hive/hive.dart';
import 'package:your_product/hive/models/VariantModel.dart';

import 'TaxModel.dart';

@HiveType(typeId: 1)
class ProductModel{
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  DateTime date_added;
  @HiveField(3)
  List<VariantModel> variants;
  @HiveField(4)
  TaxModel tax;
  @HiveField(5)
  int order_count;
  @HiveField(6)
  int shares;

  ProductModel(this.id, this.name, this.date_added,this.variants,this.tax,this.order_count,this.shares);
}