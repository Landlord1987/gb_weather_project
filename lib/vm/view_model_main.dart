import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:gb_weather_project/entity/weather.dart';

import '../api.dart';

class ViewModelMain extends ChangeNotifier {
  ViewModelMain(this.service) {
    _init();
  }

  Future<void> _init() async {
    _state = MainState(null, LoadingState.loading);
    notifyListeners();
    final data = await service.getWeather();
    _state = _state?.copy(response: data, isLoading: LoadingState.initial);
    notifyListeners();
  }

  final ApiService service;
  MainState? _state;

  MainState? get currentState => _state;
}

enum LoadingState { initial, loading, error }

class MainState {
  LoadingState? isLoading;
  WeatherResponse? response;

  MainState(this.response, this.isLoading);

  MainState copy({WeatherResponse? response, LoadingState? isLoading}) =>
      MainState(response ?? this.response, this.isLoading);
}
