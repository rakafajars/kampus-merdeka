import 'package:flutter/material.dart';
import 'package:flutter_application_1/detail_screen.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Screen',
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // navigationPage(
            //   context,
            //   const DetailScreen(),
            // );
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return const DetailScreen();
                },
                transitionDuration: const Duration(milliseconds: 500),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  // final tween = Tween(
                  //   begin: Offset(0, 0.5),
                  //   end: Offset.zero,
                  // );

                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
              ),
            );
          },
          child: Text(
            'Go to Detail Page',
          ),
        ),
      ),
    );
  }
}

navigationPage(
  BuildContext context,
  Widget page,
) {
  Navigator.push(
    context,
    PageTransition(
      child: page,
      type: PageTransitionType.bottomToTop,
    ),
  );
}
