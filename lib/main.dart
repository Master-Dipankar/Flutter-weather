import 'package:flutter/material.dart';
import 'package:weather_app/pages/currentweather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor:null,
          )
      ),
      home:CurrentWeatherPage(),
    );
  }
}