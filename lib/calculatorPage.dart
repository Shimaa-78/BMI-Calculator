import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'result.dart';
import 'Widgets/Widgets.dart';


class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

  Color _maleIconColor = Color.fromARGB(255, 138, 138, 138);
  Color _femaleIconColor = Color.fromARGB(255, 138, 138, 138);
  Color _maleBorderColor = Color.fromARGB(255, 138, 138, 138);
  Color _femaleBorderColor = Color.fromARGB(255, 138, 138, 138);
  double _height = 160;
  double _weight = 60;
  double _bmiResult = 0;

  void _calculateBMI() {
    setState(() {
      try {
        if (_weight > 0 && _height > 0) {
          _bmiResult = _weight / ((_height / 100) * (_height / 100));
        } else {
          _bmiResult = 0; // Handle error case
        }
      } catch (e) {
        _bmiResult = 0; // Handle error case
      }
    });
  }

  void _selectGender(bool isMale) {
    setState(() {
      if (isMale) {
        _maleIconColor = Color.fromARGB(255, 245, 160, 162);
        _femaleIconColor = Color.fromARGB(255, 138, 138, 138);
        _maleBorderColor = Colors.white;
        _femaleBorderColor = Color.fromARGB(255, 138, 138, 138);
      } else {
        _femaleIconColor = Color.fromARGB(255, 245, 160, 162);
        _maleIconColor = Color.fromARGB(255, 138, 138, 138);
        _femaleBorderColor = Colors.white;
        _maleBorderColor = Color.fromARGB(255, 138, 138, 138);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff38393E),
      appBar: App_Bar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildGenderSelection(),
            _buildHeightSlider(),
            _buildWeightSlider(),
            _buildCalculateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderSelection() {
    return Expanded(
      child: Row(
        children: [
          _buildGenderOption(
            label: "MALE",
            icon: Icons.male,
            isSelected: true,
            onTap: () => _selectGender(true),
          ),
          SizedBox(width: 13),
          _buildGenderOption(
            label: "FEMALE",
            icon: Icons.female,
            isSelected: false,
            onTap: () => _selectGender(false),
          ),
        ],
      ),
    );
  }

  Widget _buildGenderOption({
    required String label,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return mailOrFemail(
      Gender: label,
      borderColor: isSelected ? _maleBorderColor : _femaleBorderColor,
      IconColor: isSelected ? _maleIconColor : _femaleIconColor,
      icon: icon,
      selectGender: onTap,
    );
  }

  Widget _buildHeightSlider() {
    return slider(
      val: _height,
      unit: "CM",
      label: "HEIGHT",
      onChanged: (value) {
        setState(() {
          _height = value;
        });
      },
      min: 150,
      max: 220,
    );
  }

  Widget _buildWeightSlider() {
    return slider(
      val: _weight,
      unit: "KG",
      label: "WEIGHT",
      onChanged: (value) {
        setState(() {
          _weight = value;
        });
      },
      min: 35,
      max: 200,
    );
  }

  Widget _buildCalculateButton() {
    return CustomButton(
      p: 100,
      label: "CALCULATE",
      onTap: () {
        _calculateBMI();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Result(bmiResult: _bmiResult),
          ),
        );
      },
    );
  }
}