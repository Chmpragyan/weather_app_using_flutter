class WeatherData {
  final String cityName;
  final double tempC;
  final String text;
  final String icon;

   String get iconUrl {
    return 'http:$icon';
  }

  WeatherData({required this.tempC, required this.text, required this.icon, required this.cityName});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      cityName: json['location']['name'],
      tempC: json['current']['temp_c'],
      text: json['current']['condition']['text'],
      icon: json['current']['condition']['icon'],
    );
  }
}