
import 'package:hive/hive.dart';

import '../entity/weather.dart';

class HiveDb {
  late Box<WeatherResponse> response;
  late Box<WeatherValues> values;

  Future<void> init() async  {
    response = await Hive.openBox<WeatherResponse>('weather_response');
  }
  WeatherResponse getResponse() => response.values.toList()[0];
}