

import 'package:get/get.dart';
import 'package:shopsy/base/service/product_list_service.dart';
import 'package:shopsy/base/state_response/api_response.dart';
import 'package:shopsy/feature/product/model/product_model.dart';
import 'package:shopsy/feature/cart/repo/cart_repo.dart';
import 'package:shopsy/feature/product/repo/product_repo.dart';

class ProductController extends GetxController {
  
  Rx<ApiResponse<List<ItemsModel>>> itemsList = ApiResponse<List<ItemsModel>>.initial('').obs;


  Future<void> fetchGetProductList() async {
    itemsList.value = ApiResponse.loading('Fetching artist data');
    try {
      var itemsListResponse = await ProductRepo().getProductList();
      itemsList.value = ApiResponse.completed(itemsListResponse);
    } catch (e) {
      itemsList.value = ApiResponse.error(e.toString());
    }
  }


    Future<void> addToCart(ItemsModel product) async {    
      await CartRepo().addToCart(product);
      await fetchGetProductList();
  }
}
