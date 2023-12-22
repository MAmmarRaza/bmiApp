import 'package:flutter/material.dart';

class ReusableIconData extends StatelessWidget {
  const ReusableIconData({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 80.0,),
        SizedBox(
          height: 15.0,
        ),
        Text(
          '$label',
          style: TextStyle(
              fontSize: 18.0,
              color: Color(0xFF8D8E98)
          ),
        )
      ],
    );
  }
}
