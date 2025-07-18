

import 'package:shopsy/base/local_db/local_hive_db_service.dart';
import 'package:shopsy/feature/product/model/product_model.dart';

class CartService {


   static CartService? _instance;

  CartService._();

  static CartService get instance => _instance ??= CartService._();


  final LocalHiveDBService _localHiveDBService = LocalHiveDBService();
  static const String _cartKey = 'cart';

  Future<ItemsModel> addToCart(ItemsModel product) async {
    if ((product.itemQuantity??0) <= 0) {
      throw ArgumentError('Product quantity must be greater than 0');
    }

    final cart = await _getCartItems();
    final existingProductIndex = cart.indexWhere(
      (element) => element.itemId == product.itemId,
    );

    ItemsModel updatedProduct;

    if (existingProductIndex != -1) {
      final existingProduct = cart[existingProductIndex];
      updatedProduct = existingProduct.copyWith(
        itemQuantity: (existingProduct.itemQuantity??0) + (product.itemQuantity??0),
      );
      cart[existingProductIndex] = updatedProduct;
    } else {
      updatedProduct = product;
      cart.add(updatedProduct);
    }

    await _saveCart(cart);
    return updatedProduct;
  }

  Future<ItemsModel?> updateProductQuantity(int productId, int newQuantity) async {
    if (newQuantity < 0) {
      throw ArgumentError('Product quantity cannot be negative');
    }

    final cart = await _getCartItems();
    final productIndex = cart.indexWhere(
      (element) => element.itemId == productId,
    );

    if (productIndex == -1) {
      return null; 
    }

    ItemsModel? updatedProduct;

    if (newQuantity == 0) {
      cart.removeAt(productIndex);
      updatedProduct = null;
    } else {
      updatedProduct = cart[productIndex].copyWith(
        itemQuantity: newQuantity,
      );
      cart[productIndex] = updatedProduct;
    }

    await _saveCart(cart);
    return updatedProduct;
  }

  Future<List<ItemsModel>> getCartItems() async {
    return await _getCartItems();
  }


  Future<bool> isProductInCart(int productId) async {
    final cart = await _getCartItems();
    return cart.any((element) => element.itemId == productId);
  }

  Future<bool> removeFromCart(int productId) async {
    final cart = await _getCartItems();
    final initialLength = cart.length;
    
    cart.removeWhere((element) => element.itemId == productId);
    
    if (cart.length < initialLength) {
      await _saveCart(cart);
      return true;
    }
    
    return false; 
  }

  Future<double> getCartTotal() async {
    final cart = await _getCartItems();
    return cart.fold<double>(
      0.0,
      (total, product) => total + ((product.itemPrice??0) * (product.itemQuantity??0)),
    );
  }

  Future<void> clearCart() async {
    await _localHiveDBService.delete(_cartKey);
  }

Future<List<ItemsModel>> _getCartItems() async {
  try {
    final cart = await _localHiveDBService.get<List>(_cartKey);
    if (cart == null) return [];

    return cart.map((e) {
      if (e is Map<String, dynamic>) {
        return ItemsModel.fromJson(e);
      } else if (e is Map) {
        return ItemsModel.fromJson(Map<String, dynamic>.from(e));
      } else {
        throw ArgumentError('Invalid cart item type: ${e.runtimeType}');
      }
    }).toList();
  } catch (e) {
    print('Error retrieving cart items: $e');
    return [];
  }
}
  Future<void> _saveCart(List<ItemsModel> cart) async {
    try {
      await _localHiveDBService.put(_cartKey, cart.map((e) => e.toJson()).toList());
    } catch (e) {
      print('Error saving cart: $e');
      rethrow;
    }
  }
}