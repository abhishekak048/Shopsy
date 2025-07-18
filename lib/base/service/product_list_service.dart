
import 'package:shopsy/base/constants/product_json.dart';
import 'package:shopsy/feature/product/model/product_model.dart';

class ProductListService {

   static ProductListService? _instance;

  ProductListService._();

  static ProductListService get instance => _instance ??= ProductListService._();


  Future<List<ItemsModel>> getProductList() async {
    try {
      var productList = mockProductJson['items'];
      return List<ItemsModel>.from(
        productList?.map((product) => ItemsModel.fromJson(product))??[],
      );
    } catch (e) {
      print("error getProductList ProductListService ${e.toString()}");
      throw Exception(e);
    }
  }

  Future<ItemsModel> getProductDetailsById(int id) async {
    try {
      var productList = mockProductJson['items'];
      var product = productList!.firstWhere(
        (product) => product['items_id'] == id,
      );
      return ItemsModel.fromJson(product);
    } catch (e) {
      throw Exception(e);
    }
  }

  
}
