import 'package:flutter/material.dart';

class CustomTempText extends StatelessWidget {
  final String tempText;
  const CustomTempText({super.key, required this.tempText});

  @override
  Widget build(BuildContext context) {
    return Text(
      tempText,
      style: TextStyle(
        color: Colors.white,
        fontSize: 50,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class CustomCityName extends StatelessWidget {
  final String cityName;
  const CustomCityName({super.key, required this.cityName});

  @override
  Widget build(BuildContext context) {
    return Text(
      cityName,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
