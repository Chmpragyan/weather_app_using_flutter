import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/screens/widgets/custom_text.dart';

class CustomHomeContainer extends StatelessWidget {
  const CustomHomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 26, 10, 53),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: ((context, index) {
          return Container(
            margin: EdgeInsets.only(
              top: 30,
              left: 25,
              right: 25,
              bottom: 15,
            ),
            // padding: EdgeInsets.all(25),
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 83, 39, 154),
              borderRadius: BorderRadius.circular(35.0),
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 64, 28, 122),
                  Color.fromARGB(255, 33, 12, 69),
                ],
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomTempText(tempText: "19°",),
                    CustomCityName(cityName: "Kathmandu",),
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Lottie.asset('assets/images/wa.json', height: 70, width: 70),
                    Text(
                      "Light Rain",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
