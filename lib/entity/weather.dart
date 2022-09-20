import 'package:gb_weather_project/entity/ids_hive.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
@HiveType(typeId: TypesHive.weatherResponse)
class WeatherResponse {
  @HiveField(0)
  WeatherData? data;

  WeatherResponse({this.data});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: TypesHive.weatherData)
class WeatherData {
  @HiveField(0)
  List<TimeLines>? timelines;

  WeatherData({this.timelines});

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: TypesHive.timeLines)
class TimeLines {
  @HiveField(0)
  String? timestep;
  @HiveField(1)
  String? endTime;
  @HiveField(2)
  String? startTime;
  @HiveField(3)
  List<WeatherInterval>? intervals;

  TimeLines({this.startTime, this.endTime, this.intervals, this.timestep});

  factory TimeLines.fromJson(Map<String, dynamic> json) =>
      _$TimeLinesFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: TypesHive.intervals)
class WeatherInterval {
  @HiveField(0)
  String? startTime;
  @HiveField(1)
  WeatherValues? values;

  WeatherInterval({this.values, this.startTime});

  factory WeatherInterval.fromJson(Map<String, dynamic> json) =>
      _$WeatherIntervalFromJson(json);
}

@JsonSerializable()
@HiveType(typeId: TypesHive.weatherValues)
class WeatherValues {
  @HiveField(0)
  double? temperature;

  WeatherValues({this.temperature});

  factory WeatherValues.fromJson(Map<String, dynamic> json) =>
      _$WeatherValuesFromJson(json);
}
