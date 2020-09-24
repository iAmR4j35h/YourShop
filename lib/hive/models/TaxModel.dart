import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class TaxModel{
  @HiveField(1)
  String name;
  @HiveField(2)
  double value;
  TaxModel(this.name, this.value);
}