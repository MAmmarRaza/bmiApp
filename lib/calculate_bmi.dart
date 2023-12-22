import 'package:bmi_calculator/components/RoundIconButton.dart';
import 'package:bmi_calculator/components/reusable_IconData.dart';
import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'components/reusable_container.dart';
import 'components/reusable_text.dart';

class CalculateBMI extends StatefulWidget {
  const CalculateBMI({Key? key}) : super(key: key);

  @override
  State<CalculateBMI> createState() => _CalculateBMIState();
}

class _CalculateBMIState extends State<CalculateBMI> {
  double height = 180.00;
  double weight = 80;
  int age = 35;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ReusableText(
                text: 'BMI CALCULATOR',
                color: Colors.white,
                size: 30,
                weight: FontWeight.bold,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ReusableContainer(
                      Cardchild: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: ReusableIconData(icon: Icons.male, label: "Male"),
                      ),
                      colour: Color(0xFF1D1E33),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: ReusableContainer(
                      Cardchild: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: ReusableIconData(icon: Icons.female, label: "Female"),
                      ),
                      colour: Color(0xFF1D1E33),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: ReusableContainer(
                  Cardchild: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ReusableText(
                            text: "Height",
                            color: Colors.white,
                            size: 20,
                            weight: FontWeight.normal,
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ReusableText(
                                text: height.toStringAsFixed(2), // Display height with 2 decimal places
                                color: Colors.white,
                                size: 50,
                                weight: FontWeight.bold,
                              ),
                              ReusableText(
                                text: "cm",
                                color: Colors.white,
                                size: 20,
                                weight: FontWeight.normal,
                              )
                            ],
                          ),
                          Slider(
                            value: height,
                            min: 120.0,
                            max: 220.0,
                            onChanged: (value) {
                              setState(() {
                                height = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  colour: Color(0xFF1D1E33),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ReusableContainer(
                      Cardchild: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "WEIGHT",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                weight.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                ),
                              ),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(icon: Icons.add, onPressed: (){
                                    setState(() {
                                      weight++;
                                    });
                                  }),
                                  SizedBox(width: 10),
                                  RoundIconButton(icon: Icons.minimize, onPressed: (){
                                    setState(() {
                                      weight--;
                                    });
                                  })
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      colour: Color(0xFF1D1E33),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: ReusableContainer(
                      Cardchild: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "AGE",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                age.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                ),
                              ),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(icon: Icons.add, onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  }),
                                  SizedBox(width: 10),
                                  RoundIconButton(icon: Icons.minimize, onPressed: (){
                                    setState(() {
                                      age--;
                                    });
                                  })
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      colour: Color(0xFF1D1E33),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Calculate BMI logic here
                  double bmi = weight / ((height / 100) * (height / 100));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BMIResult(bmi: bmi),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink[800],
                  onPrimary: Colors.white,
                  minimumSize: Size(double.infinity, 48),
                ),
                child: Text(
                  "Calculate",
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
      ),
    );
  }
}
