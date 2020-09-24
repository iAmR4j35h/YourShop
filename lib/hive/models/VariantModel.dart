import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class VariantModel{
  @HiveField(0)
  int id;
  @HiveField(1)
  String color;
  @HiveField(1)
  int size;
  @HiveField(1)
  int price;

  VariantModel(this.id, this.color, this.size,this.price);
}