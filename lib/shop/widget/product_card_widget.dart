import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
    required this.productName,
    required this.isAdded,
    required this.onTap,
  });

  final String productName;
  final bool isAdded;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Image.network(
              "data:image/jpeg;base64,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",
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      productName,
                    ),
                  ),
                  IconButton(
                    onPressed: onTap,
                    icon: isAdded
                        ? Icon(
                            Icons.shopping_cart,
                            color: Colors.yellow[900],
                          )
                        : const Icon(
                            Icons.shopping_cart,
                          ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
