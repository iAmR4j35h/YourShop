import 'package:hive/hive.dart';

part 'TaxModel.g.dart';

@HiveType(typeId: 4)
class TaxModel{
  @HiveField(1)
  String name;
  @HiveField(2)
  double value;
  TaxModel(this.name, this.value);
}