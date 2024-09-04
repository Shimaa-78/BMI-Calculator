import 'package:flutter/material.dart';

AppBar App_Bar() {
  return AppBar(
    backgroundColor: Color(0xff38393E),
    leading: Icon(
      Icons.sports_gymnastics_rounded,
      color: Colors.white,
    ),
    title: Text(
      "BMI CALCULATOR",
      style: TextStyle(color: Colors.white, fontFamily: "Roboto_Condensed"),
    ),
  );
}

Expanded mailOrFemail(
    {required String Gender,
    required VoidCallback selectGender,
    required Color borderColor,
    required Color IconColor,
    required IconData icon}) {
  return Expanded(
    child: GestureDetector(
      onTap: selectGender,
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: borderColor,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: IconColor,
              size: 40,
            ),
            SizedBox(height: 10),
            Text(
              Gender,
              style: TextStyle(
                color: borderColor,
                fontFamily: "Roboto_Condensed",
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Expanded slider({
  required double val,
  required String unit,
  required String label,
  required Function(double) onChanged,
  required double min,
  required double max,
}) {
  return Expanded(
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Roboto_Condensed",
              fontSize: 20,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                val.toStringAsFixed(1),
                style: TextStyle(
                  color: Color.fromARGB(255, 245, 160, 162),
                  fontSize: 24,
                ),
              ),
              Text(
                unit,
                style: TextStyle(
                  color: Color.fromARGB(255, 138, 138, 138),
                  fontFamily: "Roboto_Condensed",
                  fontSize: 13,
                ),
              )
            ],
          ),
          SliderTheme(
            data: SliderThemeData(
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: 7, // Decrease the size of the thumb here
                disabledThumbRadius: 7,
              ),
              overlayShape: RoundSliderOverlayShape(
                overlayRadius:
                    5, // Size of the overlay when the thumb is pressed
              ),
            ),
            child: Slider(
              value: val, // Current value of the slider
              min: min, // Minimum value the slider can have
              max: max, // Maximum value the slider can have
              onChanged:
                  onChanged, // Use the provided callback to update the value
              activeColor: Color.fromARGB(
                  255, 245, 160, 162), // Color of the active part of the slider
              inactiveColor:
                  Colors.grey, // Color of the inactive part of the slider
            ),
          ),
        ],
      ),
    ),
  );
}


Widget CustomButton({required String label, required VoidCallback onTap,required double p}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
        padding: EdgeInsets.symmetric(horizontal: p),
      
        // width: 200,
        height: 30,
      
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Color.fromARGB(255, 138, 138, 138),
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "Roboto_Condensed",
          ),
        ),
      ),
    ),
  );
}
