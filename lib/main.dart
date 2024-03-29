import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/toggle_provider.dart';

import 'providers/forecast_provider.dart';
import 'screens/home_screen.dart';
import 'screens/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ForecastProvider()),
        ChangeNotifierProvider(create: (context) => ToggleProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/weather': (context) => const WeatherPage(),
        },
      ),
    );
  }
}
