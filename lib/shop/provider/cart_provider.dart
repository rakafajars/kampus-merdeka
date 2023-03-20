import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<String> _cartList = [];

  List<String> get cartList => _cartList;

  void addProductToCart(String productName) {
    _cartList.add(productName);
    notifyListeners();
  }
}
