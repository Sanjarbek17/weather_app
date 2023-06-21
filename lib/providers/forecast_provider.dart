import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../models/forecast_model.dart';

import 'constant_links.dart';

class ForecastProvider with ChangeNotifier {
  final List<HourlyForecastModel> hourlyForecasts = [
    const HourlyForecastModel(condition: '', time: '', temp: '', icon: ''),
    const HourlyForecastModel(condition: '', time: '', temp: '', icon: ''),
    const HourlyForecastModel(condition: '', time: '', temp: '', icon: ''),
    const HourlyForecastModel(condition: '', time: '', temp: '', icon: ''),
    const HourlyForecastModel(condition: '', time: '', temp: '', icon: ''),
    const HourlyForecastModel(condition: '', time: '', temp: '', icon: ''),
  ];
  final List<DailyForecastModel> dailyForecasts = [
    const DailyForecastModel(time: '', temp: '', icon: '', tempmax: 0, tempmin: 0),
    const DailyForecastModel(time: '', temp: '', icon: '', tempmax: 0, tempmin: 0),
    const DailyForecastModel(time: '', temp: '', icon: '', tempmax: 0, tempmin: 0),
    const DailyForecastModel(time: '', temp: '', icon: '', tempmax: 0, tempmin: 0),
    const DailyForecastModel(time: '', temp: '', icon: '', tempmax: 0, tempmin: 0),
    const DailyForecastModel(time: '', temp: '', icon: '', tempmax: 0, tempmin: 0),
  ];

  final String locationName = 'Uzbekistan';

  set locationName(String value) {
    locationName = value;
    notifyListeners();
  }

  Future<void> getData() async {
    Uri url = Uri.parse(baseUrl(locationName));

    final response = await http.get(url);

    Map data = jsonDecode(response.body);

    bool isNow = false;
    hourlyForecasts.clear();
    dailyForecasts.clear();
    int index = 0;
    for (Map hour in data['days'][0]['hours']) {
      DateTime dateTime = DateTime.parse("2023-06-14 ${hour['datetime']}");

      // Format the DateTime object to 12-hour format using DateFormat
      String outputTime = DateFormat('h a').format(dateTime);

      if (outputTime == DateFormat('h a').format(DateTime.now())) {
        isNow = true;
      }
      if (isNow) {
        hourlyForecasts.add(HourlyForecastModel.fromJson(hour));
      }
    }

    for (Map day in data['days']) {
      if (index == 7) {
        break;
      }
      index++;
      dailyForecasts.add(DailyForecastModel.fromJson(day));
    }

    notifyListeners();
  }
}
