import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/help_screen.dart';
import 'package:weather_app/services/weather_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // void getLocation() async{
  //   var pos = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  // }


  final _locationController = TextEditingController();
  final _weatherService = WeatherService();

  WeatherData? _weatherData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(
              context, MaterialPageRoute(builder: (context) => HelpScreen())),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_weatherData != null)
              Container(
                padding: EdgeInsets.only(top: 40),
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Color.fromARGB(255, 244, 241, 241),
                ),
                child: Column(
                  children: [
                    Image.network(_weatherData!.iconUrl),
                    SizedBox(height:10),
                    Text(
                      '${_weatherData!.tempC}°C',
                      style: TextStyle(fontSize: 40),
                    ),
                    SizedBox(height: 15,),
                    Text(
                      _weatherData!.text,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16
                      ),
                      textAlign: TextAlign.center
                    ),
                  ],
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: SizedBox(
                width: 150,
                child: TextField(
                  controller: _locationController,
                  decoration: InputDecoration(labelText: 'Location'),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            if (_locationController.text == "")
              ElevatedButton(onPressed: _search, child: Text('Save'))
            else
              ElevatedButton(onPressed: _search, child: Text('Update'))
          ],
        ),
      ),
    );
  }

  void _search() async {
    final response =
        await _weatherService.getWeatherData(_locationController.text);
    setState(() => _weatherData = response);
  }
}