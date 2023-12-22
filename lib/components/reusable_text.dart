import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  const ReusableText({required this.text, required this.color, required this.size, required this.weight
  });

  final String text;
  final Color color;
  final double size;
  final FontWeight weight;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: weight,
        ),
      ),
    );
  }
}
