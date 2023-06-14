import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:weather_app/models/forecast_model.dart';

import 'constant_links.dart';

class ForecastProvider with ChangeNotifier {
  final List<HourlyForecastModel> _hourlyForecasts = [];
  final List<ForeCastModel> _dailyForecasts = [];

  // getter for hourly forecasts
  List<HourlyForecastModel> get hourlyForecasts => [..._hourlyForecasts];

  List<ForeCastModel> get dailyForecastModel => [..._dailyForecasts];

  Future<void> getData() async {
    Uri url = Uri.parse(baseUrl('Tashkent'));

    final response = await http.get(url);

    Map data = jsonDecode(response.body);
    print(data);

    for (Map hour in data['days'][0]['hours']) {
      _hourlyForecasts.add(HourlyForecastModel(
        time: hour['datetime'],
        temp: hour['temp'].toString(),
        icon: 'assets/icons/${hour['icon']}.png',
      ));
    }

    for (Map day in data['days']) {
      _dailyForecasts.add(DailyForecastModel(
        day: day['datetime'],
        temp: day['temp'].toString(),
        icon: 'assets/icons/${day['icon']}.png',
      ));
    }
  }
}
