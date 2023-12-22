import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmiResult = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Enter Height (cm)',
                labelStyle: TextStyle(color: Colors.white, fontSize: 25),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Enter Weight (kg)',
                labelStyle: TextStyle(color: Colors.white, fontSize: 25),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: calculateBMI,
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
            ),
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Calculate BMI',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'BMI Result: ${bmiResult.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ],
      ),
    );
  }

  void calculateBMI() {
    double height = double.tryParse(heightController.text) ?? 0.0;
    double weight = double.tryParse(weightController.text) ?? 0.0;

    if (height > 0 && weight > 0) {
      double heightInMeters = height / 100;
      double bmi = weight / (heightInMeters * heightInMeters);
      setState(() {
        bmiResult = bmi;
      });
    } else {
      // Handle invalid input
      setState(() {
        bmiResult = 0.0;
      });
    }
  }
}
