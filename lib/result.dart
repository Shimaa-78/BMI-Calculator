import 'package:flutter/material.dart';
import 'package:massenger/homePage.dart';
import 'calculatorPage.dart';
import 'Widgets/Widgets.dart';

class Result extends StatelessWidget {
  final double bmiResult;

  const Result({Key? key, required this.bmiResult}) : super(key: key);

  String _getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 24.9) {
      return 'Normal weight';
    } else if (bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }

  @override
  Widget build(BuildContext context) {
    String bmiCategory = _getBMICategory(bmiResult);

    return Scaffold(
      backgroundColor: Color(0xff38393E),
      appBar: App_Bar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildBMICircleAvatar(),
          _buildBMICategoryText(bmiCategory),
          _buildActionButtons(context),
        ],
      ),
    );
  }

  Widget _buildBMICircleAvatar() {
    return CircleAvatar(
      radius: 70,
      backgroundColor: Color.fromARGB(255, 245, 160, 162),
      child: CircleAvatar(
        radius: 68,
        backgroundColor: Color(0xff38393E),
        child: Text(
          bmiResult.toStringAsFixed(1),
          style: TextStyle(
            color: Color.fromARGB(255, 138, 138, 138),
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  Widget _buildBMICategoryText(String bmiCategory) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "You Have ",
          style: TextStyle(
            color: Color.fromARGB(255, 138, 138, 138),
            fontFamily: "Roboto_Condensed",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          bmiCategory,
          style: TextStyle(
            color: Color.fromARGB(255, 245, 160, 162),
            fontFamily: "Roboto_Condensed",
            fontSize: 20,
          ),
        ),
        Text(
          " Body Weight",
          style: TextStyle(
            color: Color.fromARGB(255, 138, 138, 138),
            fontFamily: "Roboto_Condensed",
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          p: 30,
          label: "RECALCULATE",
          onTap: () => _navigateToPage(context, CalculatorPage()),
        ),
        SizedBox(width: 10),
        CustomButton(
          p: 50,
          label: "EXIT",
          onTap: () => _navigateToPage(context, HomePage()),
        ),
      ],
    );
  }

  void _navigateToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
