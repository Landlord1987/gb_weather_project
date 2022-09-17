// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) =>
    WeatherResponse(
      data: json['data'] == null
          ? null
          : WeatherData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => WeatherData(
      timelines: (json['timelines'] as List<dynamic>?)
          ?.map((e) => TimeLines.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'timelines': instance.timelines,
    };

TimeLines _$TimeLinesFromJson(Map<String, dynamic> json) => TimeLines(
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      intervals: (json['intervals'] as List<dynamic>?)
          ?.map((e) => WeatherInterval.fromJson(e as Map<String, dynamic>))
          .toList(),
      timestep: json['timestep'] as String?,
    );

Map<String, dynamic> _$TimeLinesToJson(TimeLines instance) => <String, dynamic>{
      'timestep': instance.timestep,
      'endTime': instance.endTime,
      'startTime': instance.startTime,
      'intervals': instance.intervals,
    };

WeatherInterval _$WeatherIntervalFromJson(Map<String, dynamic> json) =>
    WeatherInterval(
      values: json['values'] == null
          ? null
          : WeatherValues.fromJson(json['values'] as Map<String, dynamic>),
      startTime: json['startTime'] as String?,
    );

Map<String, dynamic> _$WeatherIntervalToJson(WeatherInterval instance) =>
    <String, dynamic>{
      'startTime': instance.startTime,
      'values': instance.values,
    };

WeatherValues _$WeatherValuesFromJson(Map<String, dynamic> json) =>
    WeatherValues(
      temperature: (json['temperature'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$WeatherValuesToJson(WeatherValues instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
    };
