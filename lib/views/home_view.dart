import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubits/weather_cubits.dart';
import 'package:weather/cubits/get_weather_cubits/weather_states.dart';
import 'package:weather/views/search_view.dart';
import 'package:weather/widgets/WeatherInfo_widget.dart';
import 'package:weather/widgets/noweather_widget.dart';

class HomeView extends StatelessWidget {
  // final String city;

   HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 20,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          centerTitle: true,
          title: const Text("Weather App",
          style: TextStyle(

          ),
          ),
          actions: [
            IconButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return const SearchView();
              },
              ),);
            },
                icon: const Icon(
                  Icons.search,

                ))
          ],
        ),
      body: BlocBuilder<WeatherCubits,WeatherStates>(
        builder: (context,state){
          if(state is NoWeatherState){
            return  NoWeather();
          }else if(state is WeatherInfoState){
            return  WeatherInfo();
          }else{
            return const Text("Oops!, There is an erorr");
          }
        },
      ),
    );
  }
}
