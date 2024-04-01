class WeatherData {
  final String cityName;
  final double tempC;
  final String wthCondition;
  final String icon;
  final String sunrise;

   String get iconUrl {
    return 'http:$icon';
  }

  WeatherData({required this.tempC, required this.wthCondition, required this.icon, required this.cityName, required this.sunrise});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      cityName: json['location']['name'],
      tempC: json['current']['temp_c'],
      wthCondition: json['current']['condition']['text'],
      icon: json['current']['condition']['icon'],
      sunrise: json['forecast']['forecastday'][0]['astro']['sunrise'],
    );
  }
}