import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const BASE_URL = 'http://api.weatherapi.com/v1';
  final String apiKey;

  // late List<String> cities = [];

  WeatherService(this.apiKey);

  // Future<WeatherData> getWeather(String location) async {
  //   final response = await http.get(
  //       Uri.parse("$BASE_URL/current.json?key=$apiKey&q=$location&aqi=no"));
  //   if (response.statusCode == 200) {
  //     return WeatherData.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to load data-------------');
  //   }
  // }


  List<Future<WeatherData>> fetchWeatherDataForCities(List<String> cities) {
    return cities.map((city) async {
      final response = await http.get(Uri.parse(
          '$BASE_URL/current.json?key=$apiKey&q=$city&aqi=no'));
      if (response.statusCode == 200) {
        return WeatherData.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load weather data for $city');
      }
    }).toList();
  }


  Future<String> getCurrentCity() async {
    // To get permission
    LocationPermission locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
    }

    // To fetch the current location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // Convert location into a list of placemart objects
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    String? city = placemark[0].locality;
    return city ?? '';
  }
}
