import 'package:shopsy/feature/product/model/product_model.dart';

class CartModel {
  List<ItemsModel> cartList;
  int cartCount;
  double totalPrice;

  CartModel({
    required this.cartCount,
    required this.cartList,
    required this.totalPrice,
  });
}
