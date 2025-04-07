import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weather});
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              getWeatherColor(weatherModel.state),
              getWeatherColor(weatherModel.state)[300]!,
              getWeatherColor(weatherModel.state)[50]!,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherModel.city,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              Text(
                'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    'http:${weatherModel.image ?? 'assets/images/thunderstorm.png'}',
                  ),
                  Text(
                    weatherModel.temp.round().toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                  Column(
                    children: [
                      Text(
                        'Maxtemp: ${weatherModel.maxTemp.round()}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Mintemp: ${weatherModel.minTemp.round()}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                weatherModel.state,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
