import 'package:hive/hive.dart';

part 'VariantModel.g.dart';

@HiveType(typeId: 2)
class VariantModel{
  @HiveField(0)
  int id;
  @HiveField(1)
  String color;
  @HiveField(2)
  int size;
  @HiveField(3)
  int price;

  VariantModel(this.id, this.color, this.size,this.price);
}