import 'package:flutter/material.dart';
import 'components/reusable_text.dart';

class BMIResult extends StatelessWidget {
  final double bmi;

  const BMIResult({Key? key, required this.bmi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                ReusableText(
                  text: 'BMI CALCULATOR',
                  color: Colors.white,
                  size: 30,
                  weight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ReusableText(
              text: 'YOUR RESULT',
              color: Colors.pinkAccent,
              size: 40,
              weight: FontWeight.bold,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF1D1E33),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 70, bottom: 70, left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      ReusableText(
                        text: "BMI: ${bmi.toStringAsFixed(1)}",
                        color: Colors.green,
                        size: 25,
                        weight: FontWeight.normal,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ReusableText(
                        text: bmiCategory(bmi),
                        color: Colors.white,
                        size: 30,
                        weight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 19.0),
                        child: ReusableText(
                          text: bmiDescription(bmi),
                          color: Colors.white,
                          size: 20,
                          weight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 40,),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.pink[800],
                onPrimary: Colors.white,
                minimumSize: Size(double.infinity, 48),
              ),
              child: Text(
                "Re-Calculate",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Helper function to determine BMI category
  String bmiCategory(double bmi) {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return "Normal";
    } else if (bmi >= 25 && bmi < 29.9) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  // Helper function to provide BMI description
  String bmiDescription(double bmi) {
    if (bmi < 18.5) {
      return "You have lower than normal body weight. Eat a bit more!";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return "Congratulations! Your body weight is normal.";
    } else if (bmi >= 25 && bmi < 29.9) {
      return "You are overweight. Consider exercising and maintaining a healthy diet.";
    } else {
      return "You are obese. Consult a doctor for a personalized health plan.";
    }
  }
}
