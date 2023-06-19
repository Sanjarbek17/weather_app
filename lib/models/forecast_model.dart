import 'package:intl/intl.dart';

class ForeCastModel {
  final String temp;
  final String icon;

  const ForeCastModel({required this.temp, required this.icon});
}

class HourlyForecastModel extends ForeCastModel {
  final String time;
  final String condition;

  const HourlyForecastModel({required this.condition, required this.time, required super.temp, required super.icon});

  factory HourlyForecastModel.fromJson(Map json) {
    // Parse the input time string into a DateTime object
    DateTime dateTime = DateTime.parse("2023-06-14 ${json['datetime']}");

    // Format the DateTime object to 12-hour format using DateFormat
    String outputTime = DateFormat('h a').format(dateTime);
    if (outputTime == DateFormat('h a').format(DateTime.now())) {
      outputTime = 'Now';
    }

    // print(outputTime); // Output: 1 AM
    return HourlyForecastModel(
      condition: json['conditions'],
      time: outputTime,
      temp: json['temp'].toString(),
      icon: 'assets/icons/${json['icon']}.png',
    );
  }
}

class DailyForecastModel extends ForeCastModel {
  final String time;
  final double tempmax;
  final double tempmin;

  const DailyForecastModel({required this.tempmax,required this.tempmin, required this.time, required super.temp, required super.icon});

  factory DailyForecastModel.fromJson(Map json) {
    // Parse the input time string into a DateTime object
    DateTime dateTime = DateTime.parse(json['datetime'].toString());

    String outputTime = DateFormat('E').format(dateTime);
    if (dateTime.day == DateTime.now().day && dateTime.month == DateTime.now().month && dateTime.year == DateTime.now().year) {
      outputTime = 'Now';
    }

    // print(outputTime); // Output: 1 AM
    return DailyForecastModel(
      tempmax: json['tempmax'],
      tempmin: json['tempmin'],
      time: outputTime,
      temp: json['temp'].toString(),
      icon: 'assets/icons/${json['icon']}.png',
    );
  }
}
