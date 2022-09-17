import 'dart:async';

import 'package:dio/dio.dart';

import 'entity/weather.dart';

class ApiService {
  final Dio client = Dio(BaseOptions(
      baseUrl: 'https://api.tomorrow.io'
  ));
  final apiKey = 'IgzqD5ZLhIQEW70AtkQDTt0OItMsgbkQ';
  StreamController<WeatherResponse> streamController = StreamController
      .broadcast();

  Future<WeatherResponse> getWeather() async {
    final response = await Dio().get(
        'https://api.tomorrow.io/v4/timelines?location=-73.98529171943665,40.75872069597532&fields=temperature&timesteps=1h&units=metric&apikey=IgzqD5ZLhIQEW70AtkQDTt0OItMsgbkQ');
    if (completedCodes.contains(response.statusCode)) {
      return WeatherResponse.fromJson(response.data);
    } else {
      throw Exception('${response.statusCode} ${response.statusMessage}');
    }
  }
}

List<int> completedCodes = [200,201,204];