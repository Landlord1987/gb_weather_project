// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherResponseAdapter extends TypeAdapter<WeatherResponse> {
  @override
  final int typeId = 1;

  @override
  WeatherResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherResponse(
      data: fields[0] as WeatherData?,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherResponse obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WeatherDataAdapter extends TypeAdapter<WeatherData> {
  @override
  final int typeId = 2;

  @override
  WeatherData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherData(
      timelines: (fields[0] as List?)?.cast<TimeLines>(),
    );
  }

  @override
  void write(BinaryWriter writer, WeatherData obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.timelines);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TimeLinesAdapter extends TypeAdapter<TimeLines> {
  @override
  final int typeId = 3;

  @override
  TimeLines read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeLines(
      startTime: fields[2] as String?,
      endTime: fields[1] as String?,
      intervals: (fields[3] as List?)?.cast<WeatherInterval>(),
      timestep: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TimeLines obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.timestep)
      ..writeByte(1)
      ..write(obj.endTime)
      ..writeByte(2)
      ..write(obj.startTime)
      ..writeByte(3)
      ..write(obj.intervals);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeLinesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WeatherIntervalAdapter extends TypeAdapter<WeatherInterval> {
  @override
  final int typeId = 4;

  @override
  WeatherInterval read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherInterval(
      values: fields[1] as WeatherValues?,
      startTime: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherInterval obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.startTime)
      ..writeByte(1)
      ..write(obj.values);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherIntervalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WeatherValuesAdapter extends TypeAdapter<WeatherValues> {
  @override
  final int typeId = 5;

  @override
  WeatherValues read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherValues(
      temperature: fields[0] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherValues obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.temperature);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherValuesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
