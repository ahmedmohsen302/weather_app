class WeatherModel {
  final String city;
  final String date;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String state;

  WeatherModel({
    required this.city,
    required this.date,
    this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.state,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      city: json['location']['name'],
      date: json['location']['localtime'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      state: json['forecast']['forecastday'][0]['day']['condition']['text'],
    );
  }
}
