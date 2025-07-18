import 'package:get/get.dart';
import 'package:shopsy/base/state_response/api_response.dart';
import 'package:shopsy/feature/cart/model/cart_model.dart';
import 'package:shopsy/feature/product/model/product_model.dart';
import 'package:shopsy/feature/cart/repo/cart_repo.dart';

class CartController extends GetxController {

  Rx<ApiResponse<CartModel>> cartList = ApiResponse<CartModel>.initial('').obs;
  RxInt cartCount = 0.obs;
  RxDouble totalPrice = 0.0.obs;

  Future<void> fetchGetProductList() async {
    cartList.value = ApiResponse.loading('Fetching artist data');
    try {
      var cartListResponse = await CartRepo().getCart();
      cartList.value = ApiResponse.completed(cartListResponse);
      cartCount.value = cartListResponse.cartCount ?? 0;
      totalPrice.value = cartListResponse.totalPrice ?? 0.0;
    } catch (e) {
      cartList.value = ApiResponse.error(e.toString());
    }
  }

  Future<void> addToCart(ItemsModel product) async {
    try {
      await CartRepo().addToCart(product);
      await fetchGetProductList();
    } catch (e) {
      print("Error adding to cart: ${e.toString()}");
    }
  }

  Future<void> clearCart() async {
    try {
      await CartRepo().clearCart();
      await fetchGetProductList();
    } catch (e) {
      print("Error clearing cart: ${e.toString()}");
    }
  }


  Future<void> getTotalPrice() async {
    try {
      double price = await CartRepo().getTotalPrice();
      totalPrice.value = price;
    } catch (e) {
      print("Error getting total price: ${e.toString()}");
      totalPrice.value = 0.0;
    }
  }


  Future<void> removeFromCart(ItemsModel product) async {
    try {
      await CartRepo().removeFromCart(product);
      await fetchGetProductList();
    } catch (e) {
      print("Error removing from cart: ${e.toString()}");
    }
  }

  Future<void> updateQuantity(ItemsModel product) async {
    try {
      await CartRepo().updateQuantity(product);
      await fetchGetProductList();
    } catch (e) {
      print("Error updating quantity: ${e.toString()}");
    }
  }

}