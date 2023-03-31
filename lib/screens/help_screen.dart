import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/homepage_screen.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final imageUrl =
      'https://www.vhv.rs/dpng/d/427-4270068_gold-retro-decorative-frame-png-free-download-transparent.png';

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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 120),
              child: Text(
                'We show weather for you',
                style: TextStyle(
                  color: Color.fromARGB(255, 76, 100, 112),
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 300,
            ),
            Container(
              child: ElevatedButton(
                onPressed: _skip,
                child: Text('Skip'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _skip() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }
}
