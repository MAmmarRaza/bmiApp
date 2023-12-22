import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  const ReusableContainer({required this.colour, this.Cardchild});
  final Color colour;
  final Widget? Cardchild;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Cardchild,
    );
  }
}
