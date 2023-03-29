import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/homepage_screen.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: _skip, child: Text('Skip')),
      ),
    );
  }

  void _skip(){
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }
}
