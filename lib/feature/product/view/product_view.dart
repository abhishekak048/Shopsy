import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopsy/feature/cart/view/cart_view.dart';
import 'package:shopsy/feature/product/controller/product_controller.dart';

import 'product_card_view.dart';


class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {

ProductController productController = Get.isRegistered<ProductController>() ? Get.find<ProductController>() : Get.put(ProductController());

@override
  void initState() {
    productController.fetchGetProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          backgroundColor: Colors.grey[50],
          appBar: AppBar(
            title: const Text(
              'Shopsy',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black87),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black87),
                onPressed: () {
                  Get.to(() => const CartView());
                },
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: productController.itemsList.value.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final product = productController.itemsList.value.data?[index];
                    return ProductCard(product: product!);
                  },
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}


