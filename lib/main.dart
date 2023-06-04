import 'package:flutter/material.dart';

import 'screens/forecast_screen.dart';
import 'screens/home_screen.dart';
import 'screens/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/weather': (context) => const WeatherPage(),
        '/forecast': (context) => const ForecastPage(),
      },
    );
  }
}
