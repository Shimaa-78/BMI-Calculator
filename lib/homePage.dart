import 'package:flutter/material.dart';
import 'calculatorPage.dart';
import 'Widgets/Widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff38393E),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 3),
            _buildTitle(),
            Spacer(flex: 3),
            _buildStartButton(context),
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "BMI",
          style: TextStyle(
            color: Color.fromARGB(255, 245, 160, 162),
            fontSize: 130,
            fontWeight: FontWeight.bold,
            height: 0.8,
          ),
        ),
        Text(
          "Calculator",
          style: TextStyle(
            color: Colors.white,
            fontSize: 62,
            fontWeight: FontWeight.bold,
          ),
        ),
        _buildWelcomeText(),
      ],
    );
  }

  Widget _buildWelcomeText() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(
        'Welcome to BMI Calculator, your personal tool for tracking your Body Mass Index (BMI) and monitoring your health.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildStartButton(BuildContext context) {
    return CustomButton(

      label: "START",
      onTap: () => _navigateToCalculatorPage(context),
    );
  }

  void _navigateToCalculatorPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CalculatorPage()),
    );
  }
}
