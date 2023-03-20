import 'package:flutter/material.dart';
import 'package:flutter_application_1/shop/model/product_model.dart';
import 'package:flutter_application_1/shop/provider/cart_provider.dart';
import 'package:flutter_application_1/shop/widget/product_card_widget.dart';
import 'package:provider/provider.dart';

class ProductListWidget extends StatefulWidget {
  final List<String> cartList;

  const ProductListWidget({super.key, required this.cartList});

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    final productList = ProductModel().productList;
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.orange.withOpacity(0.5),
      child: GridView.builder(
        itemCount: newProductList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return Consumer(
            builder: (context, CartProvider provider, widget) {
              return ProductCardWidget(
                productName: productList[index],
                isAdded: provider.cartList.contains(
                  productList[index],
                ),
                onTap: () {
                  provider.addProductToCart(
                    productList[index],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
