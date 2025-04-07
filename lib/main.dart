import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder:
            (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
              builder: (context, state) {
                return MaterialApp(
                  theme: ThemeData(
                    primaryColor: getWeatherColor(
                      BlocProvider.of<GetWeatherCubit>(
                        context,
                      ).weatherModel?.state,
                    ),
                  ),
                  home: const HomeView(),
                  debugShowCheckedModeBanner: false,
                );
              },
            ),
      ),
    );
  }
}

MaterialColor getWeatherColor(String? dayCondition) {
  switch (dayCondition) {
    // Sunny / Clear
    case 'Sunny':
    case 'Clear':
      return Colors.yellow; // Sunny: A bright, cheerful yellow

    // Partly cloudy, Cloudy
    case 'Partly cloudy':
    case 'Cloudy':
      return Colors.blueGrey; // Blue-grey for overcast skies

    // Overcast
    case 'Overcast':
      return Colors.blueGrey; // A soft, cool overcast color

    // Mist, Fog, Freezing fog
    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.teal; // Teal for misty/foggy conditions

    // Drizzle, Light Rain, Light Sleet
    case 'Patchy light drizzle':
    case 'Light drizzle':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Light sleet':
      return Colors.lightBlue; // Light blue for drizzle or light rain

    // Rain, Heavy Rain
    case 'Patchy rain possible':
    case 'Moderate rain':
    case 'Heavy rain':
    case 'Heavy rain at times':
    case 'Moderate or heavy freezing rain':
      return Colors.blue; // Blue for rain, heavier rain

    // Snow, Snow Showers
    case 'Patchy light snow':
    case 'Light snow':
    case 'Moderate snow':
    case 'Heavy snow':
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
      return Colors.cyan; // Cyan for snowy conditions

    // Thunderstorms
    case 'Thundery outbreaks possible':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.deepOrange; // Deep orange for thunderstorms

    // Ice Pellets, Freezing Drizzle
    case 'Ice pellets':
    case 'Freezing drizzle':
      return Colors.indigo; // Indigo for icy conditions

    // Anything else (fallback)
    default:
      return Colors.blueGrey; // Default color for other cases
  }
}
