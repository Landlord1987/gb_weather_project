
import 'package:gb_weather_project/api.dart';
import 'package:gb_weather_project/entity/weather.dart';
import 'package:gb_weather_project/vm/hive_db.dart';

class SharedRepository {
  final ApiService api;
  final HiveDb db;
  SharedRepository(this.api, this.db){
    db.init();
  }
  Future<void> updateData() async {
    var response = await api.getWeather();
    db.response.add(response);
  }
  WeatherResponse getFromDb() => db.getResponse();

}