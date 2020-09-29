import 'package:hive/hive.dart';
import 'package:your_product/hive/models/VariantModel.dart';

import 'TaxModel.dart';

part 'RankingProductModel.g.dart';

@HiveType(typeId: 6)
class RankingProductModel{
  @HiveField(0)
  int id;
  @HiveField(1)
  int value;
  RankingProductModel(this.id, this.value);
}