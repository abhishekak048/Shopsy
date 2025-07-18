import 'package:shopsy/feature/product/model/product_model.dart';

abstract class ProductBluePrint {
  Future<List<ItemsModel>> getProductList();

  Future<ItemsModel> getProductDetailsById(int id);
}
