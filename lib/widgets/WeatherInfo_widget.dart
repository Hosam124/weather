import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubits/weather_cubits.dart';
import 'package:weather/main.dart';
import 'package:weather/models/weather_model.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});
  @override
  Widget build(BuildContext context) {
    WeatherModel info = BlocProvider.of<WeatherCubits>(context).info!;
    return  Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
          getMaterialColor(info.condition)[500]!,
          getMaterialColor(info.condition)[50]!
        ])
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text( info.name,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                ),
                Text("Updated at ${info.lastUpdate.hour}:${info.lastUpdate.minute}",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                const Spacer(flex: 1),
                 ClipRect(
                  child: Image.network("https:${info.image}",
                  height: 100,
                    width: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                const Spacer(flex: 5,),
                Text("${info.temp}",
                  style:const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(flex: 5,),
                Column(
                  children: [
                    Text("Maxtemp = ${info.maxTemp.round()}"),
                    Text("Mintemp = ${info.minTemp.round()}")
                  ],
                ),
                const Spacer(flex: 2,)
              ],
            ),
            const SizedBox(height: 20,),
            Text(info.condition,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
