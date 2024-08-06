import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubits/weather_cubits.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/Weather_api_services.dart';
import 'package:weather/views/home_view.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        centerTitle: true,
        title: const Text("Search City"),

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async{
              var getweather= BlocProvider.of<WeatherCubits>(context);
              getweather.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              label: const Text("Search", style: TextStyle(fontSize: 20),),
              suffixIcon: Container(
                decoration: const BoxDecoration(
                  border: Border(left: BorderSide(color: Colors.red))
                ),
                child:  IconButton(onPressed: (){
                  textInputAction: TextInputAction.search;
                }, icon: Icon(Icons.search)),
              ),
              hintText: "Enter city name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
              ),

            ),
          ),
        ),
      ),
    );
  }
}

