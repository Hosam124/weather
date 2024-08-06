import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubits/weather_states.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/Weather_api_services.dart';

class WeatherCubits extends Cubit<WeatherStates>{
  WeatherCubits() : super(NoWeatherState());
  WeatherModel? info ;
  getWeather({required String cityName})async{
    try {
      info =  await WeatherServices(dio: Dio()).getInfo(city: cityName);
      emit(WeatherInfoState());
    } catch (e) {
      emit(ErorrState());
    }
  }
}