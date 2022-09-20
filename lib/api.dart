import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';

import 'entity/weather.dart';

class ApiService {
  final Dio client = Dio(BaseOptions(
    connectTimeout: 10000,
    receiveTimeout: 10000
  ));

  final apiKey = 'kClzhIAjPpVu4CyW4yfWGCmSeEsWDZbg';
  StreamController<WeatherResponse> streamController = StreamController
      .broadcast();

  Future<WeatherResponse> getWeather() async {
    client.interceptors.add(
      DioLoggingInterceptor(
        level: Level.body,
        compact: false,
      ),
    );
    print('requested');
    final response = await client.get(
        'https://api.tomorrow.io/v4/timelines?location=-73.98529171943665,40.75872069597532&fields=temperature&timesteps=1h&units=metric&apikey=IgzqD5ZLhIQEW70AtkQDTt0OItMsgbkQ');
    print(response.data);
    if (completedCodes.contains(response.statusCode)) {
      return WeatherResponse.fromJson(response.data);
    } else {
      throw Exception('${response.statusCode} ${response.statusMessage}');
    }
  }
}

List<int> completedCodes = [200,201,204];