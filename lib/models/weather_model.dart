class WeatherModel {
  final String name;
  final DateTime lastUpdate;
  final String image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String condition;

  WeatherModel(
      {required this.name, required this.lastUpdate, required this.image, required this.temp, required this.maxTemp, required this.minTemp, required this.condition});

  factory WeatherModel.fromJson(json){
    return WeatherModel(
        name: json["location"]["name"],
        lastUpdate: DateTime.parse(json["current"]["last_updated"]),
        image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
        temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
        maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
        condition:json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
    );
  }
}