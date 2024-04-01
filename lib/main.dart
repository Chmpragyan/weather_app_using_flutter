import 'package:flutter/material.dart';
import 'package:weather_app/screens/current_location.dart/current_location_screen.dart';
// import 'package:weather_app/screens/home_screen.dart/components/custom_container_home.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      home: CurrentLocationScreen(),
      // home: CustomHomeContainer(),
    );
  }
}