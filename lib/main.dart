import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubits/weather_cubits.dart';
import 'package:weather/cubits/get_weather_cubits/weather_states.dart';
import 'package:weather/views/home_view.dart';
import 'package:weather/views/search_view.dart';

void main(){
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WeatherCubits() ,
      child:  Builder(
        builder: (context) {
          return BlocBuilder<WeatherCubits,WeatherStates>(
            builder:(context,state)=> MaterialApp(
              theme: ThemeData(
                colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: getMaterialColor(
                      BlocProvider.of<WeatherCubits>(context).info?.condition,
                  ),
                )
              ),
              debugShowCheckedModeBanner: false,
              home: HomeView(),
            ),
          );
        }
      ),
    );
  }
}

MaterialColor getMaterialColor(String? condition) {
  if (condition==null){
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    case "sunny":
    case "partly cloudy":
      return Colors.amber;
    case "cloudy":
    case "overcast":
    case "fog":
    case "freezing fog":
      return Colors.grey;
    case "mist":
      return Colors.grey;
    case "patchy rain possible":
    case "patchy snow possible":
    case "patchy sleet possible":
    case "patchy freezing drizzle possible":
    case "patchy light drizzle":
    case "patchy light rain":
    case "patchy moderate snow":
    case "patchy heavy snow":
    case "patchy light snow":
      return MaterialColor(0xFF81D4FA, {
        50: Colors.blue[50]!,
        100: Colors.blue[100]!,
        200: Colors.blue[200]!,
        300: Colors.blue[300]!,
        400: Colors.blue[400]!,
        500: Colors.blue[500]!,
        600: Colors.blue[600]!,
        700: Colors.blue[700]!,
        800: Colors.blue[800]!,
        900: Colors.blue[900]!,
      });
    case "light drizzle":
    case "light rain":
    case "moderate rain at times":
    case "moderate rain":
    case "heavy rain at times":
    case "heavy rain":
    case "light freezing rain":
    case "moderate or heavy freezing rain":
    case "light sleet":
    case "moderate or heavy sleet":
      return MaterialColor(0xFF2196F3, {
        50: Colors.blue[50]!,
        100: Colors.blue[100]!,
        200: Colors.blue[200]!,
        300: Colors.blue[300]!,
        400: Colors.blue[400]!,
        500: Colors.blue[500]!,
        600: Colors.blue[600]!,
        700: Colors.blue[700]!,
        800: Colors.blue[800]!,
        900: Colors.blue[900]!,
      });
    case "blowing snow":
    case "blizzard":
    case "freezing drizzle":
    case "heavy freezing drizzle":
    case "light snow":
    case "moderate snow":
    case "heavy snow":
    case "ice pellets":
      return MaterialColor(0xFFFFFFFF, {
        50: Colors.white,
        100: Colors.white,
        200: Colors.white,
        300: Colors.white,
        400: Colors.white,
        500: Colors.white,
        600: Colors.white,
        700: Colors.white,
        800: Colors.white,
        900: Colors.white,
      });
    case "light rain shower":
    case "moderate or heavy rain shower":
    case "torrential rain shower":
      return MaterialColor(0xFF2196F3, {
        50: Colors.blue[50]!,
        100: Colors.blue[100]!,
        200: Colors.blue[200]!,
        300: Colors.blue[300]!,
        400: Colors.blue[400]!,
        500: Colors.blue[500]!,
        600: Colors.blue[600]!,
        700: Colors.blue[700]!,
        800: Colors.blue[800]!,
        900: Colors.blue[900]!,
      });
    case "light sleet showers":
    case "moderate or heavy sleet showers":
      return MaterialColor(0xFF81D4FA, {
        50: Colors.blue[50]!,
        100: Colors.blue[100]!,
        200: Colors.blue[200]!,
        300: Colors.blue[300]!,
        400: Colors.blue[400]!,
        500: Colors.blue[500]!,
        600: Colors.blue[600]!,
        700: Colors.blue[700]!,
        800: Colors.blue[800]!,
        900: Colors.blue[900]!,
      });
    case "light snow showers":
    case "moderate or heavy snow showers":
      return MaterialColor(0xFF81D4FA, {
        50: Colors.blue[50]!,
        100: Colors.blue[100]!,
        200: Colors.blue[200]!,
        300: Colors.blue[300]!,
        400: Colors.blue[400]!,
        500: Colors.blue[500]!,
        600: Colors.blue[600]!,
        700: Colors.blue[700]!,
        800: Colors.blue[800]!,
        900: Colors.blue[900]!,
      });
    case "light showers of ice pellets":
    case "moderate or heavy showers of ice pellets":
      return MaterialColor(0xFF81D4FA, {
        50: Colors.blue[50]!,
        100: Colors.blue[100]!,
        200: Colors.blue[200]!,
        300: Colors.blue[300]!,
        400: Colors.blue[400]!,
        500: Colors.blue[500]!,
        600: Colors.blue[600]!,
        700: Colors.blue[700]!,
        800: Colors.blue[800]!,
        900: Colors.blue[900]!,
      });
    case "thundery outbreaks possible":
    case "patchy light rain with thunder":
    case "moderate or heavy rain with thunder":
    case "patchy light snow with thunder":
    case "moderate or heavy snow with thunder":
      return MaterialColor(0xFF673AB7, {
        50: Colors.deepPurple[50]!,
        100: Colors.deepPurple[100]!,
        200: Colors.deepPurple[200]!,
        300: Colors.deepPurple[300]!,
        400: Colors.deepPurple[400]!,
        500: Colors.deepPurple[500]!,
        600: Colors.deepPurple[600]!,
        700: Colors.deepPurple[700]!,
        800: Colors.deepPurple[800]!,
        900: Colors.deepPurple[900]!,
      });
    default:
      return Colors.blue; // Default color for unknown conditions
  }
}
