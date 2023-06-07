class ForeCastModel {
  String temp;
  String icon;

  ForeCastModel({required this.temp, required this.icon});
}

class HourlyForecastModel extends ForeCastModel {
  String time;

  HourlyForecastModel({required this.time, required super.temp, required super.icon});

  factory HourlyForecastModel.fromJson(Map<String, dynamic> json) {
    return HourlyForecastModel(
      time: json['time'],
      temp: json['temp'],
      icon: json['icon'],
    );
  }
}

class DailyForecastModel extends ForeCastModel {
  String day;

  DailyForecastModel({required this.day, required super.temp, required super.icon});

  factory DailyForecastModel.fromJson(Map<String, dynamic> json) {
    return DailyForecastModel(
      day: json['day'],
      temp: json['temp'],
      icon: json['icon'],
    );
  }
}
