
import 'package:shopsy/base/service/product_list_service.dart';
import 'package:shopsy/feature/product/model/product_model.dart';
import 'package:shopsy/feature/product/repo/product_blueprint.dart';




class ProductRepo implements ProductBluePrint {
  final ProductListService _productListService = ProductListService.instance;

  @override
  Future<ItemsModel> getProductDetailsById(int id) async {
    var result = await _productListService.getProductDetailsById(id);
    return result;
  }

  @override
  Future<List<ItemsModel>> getProductList() async {
    var result = await _productListService.getProductList();
    return result;
  }
}
