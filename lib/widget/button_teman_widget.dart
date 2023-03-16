import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String titleButton;
  final Color? backgroundColor;
  final Function()? onPressed;
  const ButtonWidget({
    super.key,
    required this.titleButton,
    this.backgroundColor = Colors.green,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
      child: Text(
        titleButton,
      ),
    );
  }
}
