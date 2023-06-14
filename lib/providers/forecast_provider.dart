import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

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
    // print(data);
    print('ForecastProvider: getData() called');
    print('hourlyForecasts: ${data['days'][0]['hours'].length}');
    bool isNow = false;
    for (Map hour in data['days'][0]['hours']) {
      DateTime dateTime = DateTime.parse("2023-06-14 ${hour['datetime']}");

      // Format the DateTime object to 12-hour format using DateFormat
      String outputTime = DateFormat('h a').format(dateTime);

      if (outputTime == DateFormat('h a').format(DateTime.now())) {
        isNow = true;
      }
      if (isNow) {
        _hourlyForecasts.add(HourlyForecastModel.fromJson(hour));
      }
    }
    print('dailyForecasts: ');
    for (Map day in data['days']) {
      _dailyForecasts.add(DailyForecastModel.fromJson(day));
    }
    print('done');
  }
}
