import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';
class WeatherService{
  Future<WeatherData> getWeatherData(String location) async{
    final qParams = {
      'q': location,
      'key': '9da84fe2eae84538b2823858232803',
    };

    final uri = Uri.http('api.weatherapi.com', '/v1/current.json', qParams);
    final response = await http.get(uri);

    print(response.body);
    
    if(response.statusCode == 200){
      return WeatherData.fromJson(jsonDecode(response.body));
    }else{
      throw Exception("Error");
    }
    
    // final json = jsonDecode(response.body);
    // return WeatherData.fromJson(json);
  }
}