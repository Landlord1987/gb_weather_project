import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:gb_weather_project/entity/weather.dart';
import 'package:gb_weather_project/vm/hive_db.dart';
import 'package:gb_weather_project/vm/repository.dart';

import '../api.dart';

class ViewModelMain extends ChangeNotifier {
  ViewModelMain(this.repository){
    repository.db.init().then((value) => Future.delayed(Duration.zero, show));
  }
  final SharedRepository repository;
  MainState? _state;
  Future<void> getData() async {
    _state = MainState(null, LoadingState.loading);
    notifyListeners();
    await repository.updateData();
    _state = _state?.copy(response: null, isLoading: LoadingState.initial);
    notifyListeners();
  }
  Future<void> show() async {
    _state = MainState(null, LoadingState.loading);
    var data = repository.getFromDb();
    _state = _state?.copy(response: data, isLoading: LoadingState.initial);
    notifyListeners();
  }

  MainState? get currentState => _state;
}

enum LoadingState { initial, loading, error }

class MainState {
  LoadingState? isLoading;
  WeatherResponse? response;

  MainState(this.response, this.isLoading);

  MainState copy({WeatherResponse? response, LoadingState? isLoading}) =>
      MainState(response ?? this.response, isLoading ?? this.isLoading);
}
