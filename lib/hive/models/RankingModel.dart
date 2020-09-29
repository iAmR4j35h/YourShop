import 'package:hive/hive.dart';
import 'package:your_product/hive/models/ProductModel.dart';
import 'package:your_product/hive/models/RankingProductModel.dart';

part 'RankingModel.g.dart';

@HiveType(typeId: 5)
class RankingModel{

  @HiveField(0)
  String ranking;
  @HiveField(1)
  List<RankingProductModel> products;
  RankingModel(this.ranking, this.products);
}