import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _locationController = TextEditingController();
  final _weatherService = WeatherService();

  WeatherData? _weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(_weatherData != null)
              Column(
                children: [
                  Image.network(_weatherData!.iconUrl),
                  Text(
                    '${_weatherData!.tempC}',
                    style: TextStyle(fontSize: 40),
                  ),
                  Text(_weatherData!.text),
                ],
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
            if(_locationController.text == "")
              ElevatedButton(onPressed: _search, child: Text('Save'))
            else
              ElevatedButton(onPressed: _search, child: Text('Update'))
          ],
        ),
      ),
    );
  }

  void _search() async {
    final response = await _weatherService.getWeatherData(_locationController.text);
    setState(() => _weatherData = response);
  }
}