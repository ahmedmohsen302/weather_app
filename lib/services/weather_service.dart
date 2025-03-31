import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '669739b05d7d4667ade173505253103';

  WeatherService(this.dio);

  Future<WeatherModel> getWeather({required String city}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$city&days=1',
      );
      WeatherModel weatherModel = response.data;
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage =
          e.response?.data['error']['message'] ?? 'Oops, there was an error';
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception("Oops, there was an error");
    }
  }
}
