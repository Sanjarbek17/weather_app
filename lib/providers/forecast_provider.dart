import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:weather_app/models/forecast_model.dart';

import 'constant_links.dart';

class ForecastProvider with ChangeNotifier {
  final List<HourlyForecastModel> _hourlyForecasts = [
    HourlyForecastModel(time: '12 pm', temp: '19', icon: 'assets/icons/Sun cloud mid rain.png'),
    HourlyForecastModel(time: 'Now', temp: '19', icon: 'assets/icons/Sun cloud mid rain.png'),
    HourlyForecastModel(time: '12 pm', temp: '19', icon: 'assets/icons/Sun cloud mid rain.png'),
    HourlyForecastModel(time: '12 pm', temp: '19', icon: 'assets/icons/Sun cloud mid rain.png'),
    HourlyForecastModel(time: '12 pm', temp: '19', icon: 'assets/icons/Sun cloud mid rain.png'),
    HourlyForecastModel(time: '12 pm', temp: '19', icon: 'assets/icons/Sun cloud mid rain.png'),
  ];
  final List<ForeCastModel> _dailyForecasts = [];

  // getter for hourly forecasts
  List<HourlyForecastModel> get hourlyForecasts => [..._hourlyForecasts];

  List<ForeCastModel> get dailyForecastModel => [..._dailyForecasts];

  Future<void> getData() async {
    Uri url = Uri.parse(baseUrl('Tashkent'));

    final response = await http.get(url);

    print(response.body);
  }
}
