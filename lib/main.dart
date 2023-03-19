import 'package:flutter/material.dart';
import 'package:transaction/pages/transaction2.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor:null,
          )
      ),
      home:const Transaction2(),
    );
  }
}