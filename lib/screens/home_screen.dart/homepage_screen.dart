import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final weatherService = WeatherService("9da84fe2eae84538b2823858232803");
  // WeatherData? _weatherData;

  late List<String> cities = [];
  late List<Future<WeatherData>> futureWeatherList = [];

  // fetchWeather() async {
  //   String location = await weatherService.getCurrentCity();

  //   try {
      // final weatherData = await weatherService.getWeather(location);
      // setState(() {
      //   _weatherData = weatherData;
      // });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  String getWeatherAnimation(String? wthCondition){
    print(wthCondition);
    if (wthCondition == null) return 'assets/images/Sunny.json';

      switch (wthCondition.toLowerCase()){
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

  // @override
  // void initState() {
  //   super.initState();
  //   fetchWeather();
  // }

  fetchWeatherList() async{
    String location = await weatherService.getCurrentCity();
    cities = [location,'London', 'New York', 'Paris'];
    final weatherData = await weatherService.fetchWeatherDataForCities(cities);
      setState(() {
        futureWeatherList = weatherData;
      });
  }

  @override
  void initState() {
    super.initState();
    fetchWeatherList();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return FutureBuilder<WeatherData>(
            future: futureWeatherList[index],
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListTile(
                  title: Text(snapshot.data!.cityName),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${snapshot.data!.tempC.toStringAsFixed(1)}°C'),
                      Text(snapshot.data!.wthCondition),
                    ],
                  ),
                  leading: Image.network(snapshot.data!.iconUrl),
                );
              } else if (snapshot.hasError) {
                return ListTile(
                  title: Text('Error loading weather data for ${cities[index]}'),
                  subtitle: Text('${snapshot.error}'),
                );
              }
              return ListTile(
                title: Text('Loading...'),
                leading: CircularProgressIndicator(),
              );
            },
          );
        },
      ),

      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text(_weatherData?.cityName ?? 'Loading...'),
      //       Text('${_weatherData?.tempC.round()}\u2103'),
      //       Lottie.asset(getWeatherAnimation(_weatherData?.wthCondition)),
      //       Text(_weatherData?.wthCondition ?? 'Loading...'),
      //       // // Image.network(_weatherData?.iconUrl ?? ''),
      //       // _weatherData?.iconUrl != null && _weatherData!.iconUrl.isNotEmpty
      //       //     ? Image.network(
      //       //         _weatherData!.iconUrl,
      //       //         fit: BoxFit.cover,
      //       //       )
      //       //     : CircularProgressIndicator(),
      //     ],
      //   ),
      // ),
    );
  }
}



// // import 'package:flutter/material.dart';
// // // import 'package:geolocator/geolocator.dart';
// // import 'package:weather_app/models/weather_model.dart';
// // import 'package:weather_app/services/weather_service.dart';

// // class HomePage extends StatefulWidget {
// //   const HomePage({super.key});

// //   @override
// //   State<HomePage> createState() => _HomePageState();
// // }

// // class _HomePageState extends State<HomePage> {

// //   // void getLocation() async{
// //   //   var pos = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
// //   // }

// //   @override
// //   void initState() {
// //     super.initState();
// //     _search();
// //   }


// //   final _locationController = TextEditingController();
// //   final _weatherService = WeatherService();

// //   WeatherData? _weatherData;
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Weather"),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             if (_weatherData != null)
// //               Container(
// //                 padding: EdgeInsets.only(top: 40),
// //                 height: MediaQuery.of(context).size.height * 0.4,
// //                 width: MediaQuery.of(context).size.width * 0.5,
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(13),
// //                   color: Color.fromARGB(255, 244, 241, 241),
// //                 ),
// //                 child: Column(
// //                   children: [
// //                     Image.network(_weatherData!.iconUrl),
// //                     SizedBox(height:10),
// //                     Text(
// //                       '${_weatherData!.tempC}°C',
// //                       style: TextStyle(fontSize: 40),
// //                     ),
// //                     SizedBox(height: 15,),
// //                     Text(
// //                       _weatherData!.text,
// //                       style: TextStyle(
// //                         fontWeight: FontWeight.w500,
// //                         fontSize: 16
// //                       ),
// //                       textAlign: TextAlign.center
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             // Padding(
// //             //   padding: EdgeInsets.symmetric(vertical: 50),
// //             //   child: SizedBox(
// //             //     width: 150,
// //             //     child: TextField(
// //             //       controller: _locationController,
// //             //       decoration: InputDecoration(labelText: 'Location'),
// //             //       textAlign: TextAlign.center,
// //             //     ),
// //             //   ),
// //             // ),
// //             // if (_locationController.text == "")
// //             //   ElevatedButton(onPressed: _search, child: Text('Save'))
// //             // else
// //             //   ElevatedButton(onPressed: _search, child: Text('Update'))
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   void _search() async {
// //     // final response =
// //     //     await _weatherService.getWeatherData(_locationController.text);
// //     setState(() => _weatherData);
// //   }
// // }