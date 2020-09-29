import 'package:your_product/network/ApiProvider.dart';
import 'package:your_product/network/ProductsDataResponseModel.dart';

class ProductsRepo{
  ApiProvider _provider = ApiProvider();

  Future<ProductsDataResponseModel> fetchProductData() async {
    final response = await _provider.get("json/");
    return ProductsDataResponseModel.fromJson(response);

  }
}