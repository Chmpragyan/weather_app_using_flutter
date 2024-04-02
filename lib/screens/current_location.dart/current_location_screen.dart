import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/widgets/custom_text.dart';
import 'package:weather_app/services/weather_services.dart';

class CurrentLocationScreen extends StatefulWidget {
  const CurrentLocationScreen({super.key});

  @override
  State<CurrentLocationScreen> createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  final weatherService = WeatherService("9da84fe2eae84538b2823858232803");
  // WeatherData? _weatherData;

  // late List<String> cities = [];
  // late List<Future<WeatherData>> futureWeatherList = [];

  String getWeatherAnimation(String? wthCondition) {
    // print(wthCondition);
    if (wthCondition == null) return 'assets/images/Sunny.json';

    switch (wthCondition.toLowerCase()) {
      case 'light rain':
        return 'assets/images/wa.json';
      case 'light drizzle':
        return 'assets/images/wd.json';
      case 'mist':
        return 'assets/images/wc.json';
      case 'cloudy':
        return 'assets/images/wb.json';
      case 'partly cloudy':
        return 'assets/images/we.json';
      case 'clear':
        return 'assets/images/Sunny.json';
      default:
        return 'assets/images/Sunny.json';
    }
  }

  // fetchWeatherList() async {
  //   String location = await weatherService.getCurrentCity();
  //   cities = [location, 'London', 'New York', 'Paris'];
  //   final weatherData = await weatherService.fetchWeatherDataForCities(cities);
  //   setState(() {
  //     futureWeatherList = weatherData;
  //   });
  // }

  WeatherData? _weatherData;

  @override
  void initState() {
    super.initState();
    // fetchWeatherList();
    fetchCurrentData();
  }

  void fetchCurrentData() async {
    String location = await weatherService.getCurrentCity();
    final response = await weatherService.getWeather(location);
    setState(() {
      _weatherData = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: SlidingUpPanel(
        minHeight: MediaQuery.of(context).size.height * 0.35,
        maxHeight: MediaQuery.of(context).size.height * 0.7,
        panel: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Hourly Forecast"),
                Text("Weekly Forecast"),
              ],
            ),
            Divider(
              thickness: 4,
              color: Color.fromARGB(202, 230, 225, 225),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(50),
                  bottom: Radius.circular(50),
                ),
              ),
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisExtent: 70,
                  mainAxisSpacing: 8,
                  // childAspectRatio: 60 / 100,
                ),
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.elliptical(50, 50),
                        bottom: Radius.elliptical(50, 50),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("12PM"),
                        Icon(Icons.cloud),
                        Text("19"),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 160,
              padding: EdgeInsets.only(left: 20.0, right: 15.0),
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.purple[900],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "AIR QUALITY",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "3-Low Health Risk",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "See more",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        // collapsed: Container(
        //   decoration:
        //       BoxDecoration(color: Colors.blueGrey, borderRadius: radius),
        //   child: Center(
        //     child: Text(
        //       "This is the collapsed Widget",
        //       style: TextStyle(color: Colors.white),
        //     ),
        //   ),
        // ),
        body: Padding(
          padding: EdgeInsets.only(top: 70),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.,
            children: [
              Text(
                _weatherData?.cityName ?? 'No data',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
              Text(
                '${_weatherData?.tempC ?? 0}°',
                style: TextStyle(
                  fontSize: 90,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              Text(
                _weatherData?.wthCondition ?? 'No data',
                style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomCityName(cityName: 'H: ${_weatherData?.maxTemp ?? 0}|'),
                  CustomCityName(cityName: 'L: ${_weatherData?.minTemp ?? 0}'),
                ],
              ),
              Lottie.asset(
                getWeatherAnimation(_weatherData?.wthCondition),
                height: 200,
              ),
            ],
          ),
        ),
        borderRadius: radius,
      ),
    );
  }
}
