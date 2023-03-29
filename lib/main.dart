import 'package:flutter/material.dart';
import 'package:weather_app/screens/help_screen.dart';
import 'package:weather_app/screens/homepage_screen.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HelpScreen(),
    );
  }
}