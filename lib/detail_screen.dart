import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/home_screen.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Screen',
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            navigationPage(
              context,
              const DetailScreen(),
            );
          },
          child: Text(
            'Go Back',
          ),
        ),
      ),
    );
  }
}
