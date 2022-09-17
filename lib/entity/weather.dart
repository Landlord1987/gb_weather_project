import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class WeatherResponse {
  WeatherData? data;

  WeatherResponse({this.data});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);
}

@JsonSerializable()
class WeatherData {
  List<TimeLines>? timelines;

  WeatherData({this.timelines});

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);
}

@JsonSerializable()
class TimeLines {
  String? timestep;
  String? endTime;
  String? startTime;
  List<WeatherInterval>? intervals;

  TimeLines({this.startTime, this.endTime, this.intervals, this.timestep});

  factory TimeLines.fromJson(Map<String, dynamic> json) =>
      _$TimeLinesFromJson(json);
}

@JsonSerializable()
class WeatherInterval {
  String? startTime;
  WeatherValues? values;

  WeatherInterval({this.values, this.startTime});

  factory WeatherInterval.fromJson(Map<String, dynamic> json) =>
      _$WeatherIntervalFromJson(json);
}

@JsonSerializable()
class WeatherValues {
  double? temperature;

  WeatherValues({this.temperature});

  factory WeatherValues.fromJson(Map<String, dynamic> json) =>
      _$WeatherValuesFromJson(json);
}
