import 'package:flutter/material.dart';
import 'package:flutter_application_1/shop/screen/cart_page.dart';
import 'package:flutter_application_1/shop/widget/product_list_widget.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<String> _cartList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laptop Shop'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CartPage(
                    cartList: _cartList,
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
        ],
      ),
      body: ProductListWidget(
        cartList: _cartList,
      ),
    );
  }
}
