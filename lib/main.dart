import 'package:flutter/material.dart';
import 'package:sy_travel_animation/utils/constantes.dart';
import 'package:sy_travel_animation/main_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SY TRAVEL EXPEDITION',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
       scaffoldBackgroundColor: mainBlack,
      ),
      home: MainView(),
    );
  }
}


