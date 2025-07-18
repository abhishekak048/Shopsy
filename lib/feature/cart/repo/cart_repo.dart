
import 'package:shopsy/base/service/local_cart_service.dart';
import 'package:shopsy/feature/cart/model/cart_model.dart';
import 'package:shopsy/feature/product/model/product_model.dart';
import 'package:shopsy/feature/cart/repo/car_blueprint.dart';

class CartRepo implements CartBlueprint {
  final CartService _cartService = CartService.instance;

  @override
  Future<ItemsModel> addToCart(ItemsModel product) async {
    return await _cartService.addToCart(product);
  }

  @override
  Future<void> clearCart() async {
    await _cartService.clearCart();
  }

  @override
  Future<CartModel> getCart() async {
    var result = await _cartService.getCartItems();
    double totalPrice = await _cartService.getCartTotal();
    return CartModel(
      cartCount: result.length,
      cartList: result,
      totalPrice: totalPrice,
    );
  }

 
  @override
  Future<double> getTotalPrice() async {
    return await _cartService.getCartTotal();
  }

  @override
  Future<void> removeFromCart(ItemsModel product) async {
  await _cartService.removeFromCart(product.itemId!);
  }

  @override
  Future<ItemsModel?> updateQuantity(ItemsModel product) async {
    return await _cartService.updateProductQuantity(product.itemId!, product.itemQuantity!);;
  }


}
