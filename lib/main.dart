import 'package:flutter/material.dart';
import 'package:flutter_application_1/shop/provider/cart_provider.dart';
import 'package:flutter_application_1/shop/screen/product_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        title: 'Flutter Demo',
        home: const ProductPage(),
      ),
    );
  }
}
