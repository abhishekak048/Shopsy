import 'package:shopsy/feature/cart/model/cart_model.dart';
import 'package:shopsy/feature/product/model/product_model.dart';

abstract class CartBlueprint {
  Future<CartModel> getCart();

  Future<ItemsModel> addToCart(ItemsModel product);

  Future<ItemsModel?> updateQuantity(ItemsModel product);


  Future<void> removeFromCart(ItemsModel product);


  Future<double> getTotalPrice();

  Future<void> clearCart();
}
