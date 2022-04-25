import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mc_weather_app/constantes.dart';
import 'package:mc_weather_app/main_screen.dart';

void main() {
  // changer la couleur de la "barre de notification" (tbh jss pas wassemha)
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: beige, // status bar color
    ),
  );
  runApp(
        const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const MainScreen(),
      ));
}

