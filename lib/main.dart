import 'package:bmi_calculator/calculate_bmi.dart';
import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'bmi_screen.dart';

void main() {
  runApp(BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: SafeArea(child: CalculateBMI()),
    );
  }
}
