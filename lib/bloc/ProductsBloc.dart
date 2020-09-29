import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:your_product/bloc/BlocProvider.dart';
import 'package:your_product/bloc/ProductsRepo.dart';
import 'package:your_product/hive/models/CategoryModel.dart';
import 'package:your_product/hive/models/ProductModel.dart';
import 'package:your_product/hive/models/RankingModel.dart';
import 'package:your_product/hive/models/RankingProductModel.dart';
import 'package:your_product/hive/models/TaxModel.dart';
import 'package:your_product/hive/models/VariantModel.dart';

class ProductsBloc extends BlocBase {
  final _productRepo = ProductsRepo();

  ProductsBloc() {
    initBox();
  }

  Box<CategoryModel> _cateogryBox;
  Box<ProductModel> _productBox;
  Box _taxBox;
  Box _varientBox;
  Box _rankingBox;
  Box _rankingProductBox;

  initBox() async {
    _cateogryBox = Hive.box<CategoryModel>('categoryBox');
    _rankingBox = Hive.box<RankingModel>('rankingBox');
    _productBox = Hive.box<ProductModel>('productBox');
    // fetchData();
  }

  Future fetchData() async {
    final productsData = await _productRepo.fetchProductData();
    await _productBox.clear();
    var categories = productsData.categories.map((cat) => CategoryModel(
        cat.id,
        cat.name,
        cat.products.map((prod) {
          ProductModel product = ProductModel(
              prod.id,
              prod.name,
              DateTime.parse(prod.dateAdded),
              prod.variants.map((vari) => (VariantModel(vari.id, vari.color, vari.size, vari.price))).toList(),
              TaxModel(prod.tax.name, prod.tax.value),
              0,
              0);
          _productBox.add(product);

          return product;
        }).toList(),
        cat.childCategories.toList()));

    await _cateogryBox.clear();
    _cateogryBox.addAll(categories);

    var rankings = productsData.rankings
        .map((e) => RankingModel(e.ranking,
            e.products.map((p) => RankingProductModel(p.id, (p.shares ?? p.orderCount ?? p.viewCount))).toList()))
        .toList();
    await _rankingBox.clear();
    _rankingBox.addAll(rankings);

    print("inserted count ${_cateogryBox.length}");
  }

  Future<List<CategoryModel>> getCategories(CategoryModel catModel) async {
    if (catModel == null) {
      return _cateogryBox.values.where((element) => !haveParent(element.id)).toList();
    } else {
      return _cateogryBox.values.where((element) => catModel.child_categories.contains(element.id)).toList();
    }
  }

  Future<List<ProductModel>> getProducts({int catId, RankingModel rank}) async {
    print("CAT id $catId");
    if (rank == null) {
      return _cateogryBox.values.where((element) => element.id == catId).toList()[0].products.toList();
    } else {
      var ranksList = rank.products;
      ranksList.sort((a, b) => b.value.compareTo(a.value));
      var filteredProductList = List<ProductModel>();
      ranksList.forEach((element) {
        filteredProductList.add(_productBox.values.where((e) => element.id == e.id).toList()[0]);
      });
      return filteredProductList;
    }
  }

  Future<List<RankingModel>> getRankingList() async {
    return _rankingBox.values.toList();
  }

  List getSubCategories(List<int> ids) {
    return _cateogryBox.values.where((element) => ids.contains(element.id)).toList();
  }

  bool haveParent(int catId) {
    bool value = false;
    _cateogryBox.values.toList().forEach((item) {
      if (item.child_categories.contains(catId)) {
        value = true;
      }
    });
    return value;
  }

  Future getProduct(int id) async {
    return _productBox.values.where((element) => element.id == id).toList()[0];
  }

  @override
  void dispose() {}
}
