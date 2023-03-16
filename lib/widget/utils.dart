import 'package:flutter/material.dart';

class UtilsGlobal {
  Widget informationPayment({
    required String title,
    required String subtitle,
    bool isFontWeight700 = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isFontWeight700 ? FontWeight.w700 : FontWeight.w500,
            color: isFontWeight700 ? Colors.black : const Color(0xFF898989),
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
