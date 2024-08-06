import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherServices{
 final Dio dio;

 WeatherServices({required this.dio});

 String baseUrl = "https://api.weatherapi.com/v1";
 String apikey = "6e01a74712e243e2a8995304233011";
 Future<WeatherModel> getInfo({required String city}) async{
   try {
     Response response = await dio.get(
         "$baseUrl/forecast.json?key=$apikey&q=$city&days=1");

     WeatherModel weatherInfo =  WeatherModel.fromJson(response.data);
     return weatherInfo;
   } on DioException catch (e) {
     String erorrMessage = e.response?.data["error"]["message"] ?? "Oops ! , there is an erorr. \nTry later";
     throw Exception(erorrMessage);
   }catch(e){
     log(e.toString());
     throw Exception("Oops ! , there is an erorr. \nTry later");
   }
 }
}