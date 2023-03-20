import 'package:flutter/material.dart';
import 'package:flutter_application_1/shop/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  final List<String> cartList;
  const CartPage({
    super.key,
    required this.cartList,
  });

  @override
  Widget build(BuildContext context) {
    final cartListProvider = Provider.of<CartProvider>(context).cartList;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart Page',
        ),
      ),
      body: Container(
        color: Colors.orange.withOpacity(0.5),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartListProvider.length,
                itemBuilder: (cobntext, index) {
                  return Text(cartListProvider[index]);
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Buy',
              ),
            )
          ],
        ),
      ),
    );
  }
}
