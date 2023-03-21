import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';

class CurrentWeatherPage extends StatefulWidget{
  @override
  _CurrentWeatherPageState createState() => _CurrentWeatherPageState();
}
class _CurrentWeatherPageState extends State<CurrentWeatherPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          builder: (context, AsyncSnapshot<Weather> snapshot) {
            if (snapshot.hasError) {
              return Text("Error Getting the Weather Details");
            }
            if (snapshot.hasData) {
              Weather _weather = snapshot.data!;
              return weatherBox(_weather);
            } else {
              return CircularProgressIndicator();
            }
          },
          future: getCurrentWeather(),
        ),
      ),
    );
  }
}
Widget weatherBox(Weather _weather){
  return Column(
    children: <Widget>[
      Text("${_weather.temp}*C"),
      Text("${_weather.description}*C"),
      Text("${_weather.feelsLike}*C"),
      Text("H:${_weather.high}*C L:${_weather.low}*C"),
    ],
  );
}
Future<Weather> getCurrentWeather() async {
  Weather weather;
  // String city = "Guwahati";
  // String apiKey = "e08e24f8a96e8e84de3ac9b675d32489";
  var url = Uri.parse("https://api.open-meteo.com/v1/forecast?latitude=26.18&longitude=91.75&hourly=temperature_2m");

  final response = await http.get(url);

  if (response.statusCode == 200) {
    weather = Weather.fromJson(jsonDecode(response.body));
    print(response.body);
    return weather; // return the weather object
  } else {
    throw Exception('Failed to load weather');
  }
}
