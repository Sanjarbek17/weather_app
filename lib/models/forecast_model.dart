import 'package:intl/intl.dart';

class ForeCastModel {
  String temp;
  String icon;

  ForeCastModel({required this.temp, required this.icon});
}

class HourlyForecastModel extends ForeCastModel {
  String time;

  HourlyForecastModel({required this.time, required super.temp, required super.icon});

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
      time: outputTime,
      temp: json['temp'].toString(),
      icon: 'assets/icons/${json['icon']}.png',
    );
  }
}

class DailyForecastModel extends ForeCastModel {
  String time;

  DailyForecastModel({required this.time, required super.temp, required super.icon});

  factory DailyForecastModel.fromJson(Map json) {
    // Parse the input time string into a DateTime object
    DateTime dateTime = DateTime.parse(json['datetime'].toString());

    String outputTime = DateFormat('E').format(dateTime);
    if (dateTime.day == DateTime.now().day && dateTime.month == DateTime.now().month && dateTime.year == DateTime.now().year) {
      outputTime = 'Now';
    }

    // print(outputTime); // Output: 1 AM
    return DailyForecastModel(
      time: outputTime,
      temp: json['temp'].toString(),
      icon: 'assets/icons/${json['icon']}.png',
    );
  }
}
