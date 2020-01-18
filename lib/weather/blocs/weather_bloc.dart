import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/weather/api/repository.dart';
import 'package:flutter_app/weather/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  final Repository repo;

  WeatherBloc(this.repo);

  @override
  WeatherState get initialState => WeatherEmpty();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is FetchWeatherEvent) {
      yield WeatherLoading();
      try {
        print(event.city);
        final Weather weather = await repo.getWeather(event.city);
        yield WeatherLoaded(weather: weather);
      } on Exception catch (_) {
        yield WeatherError();
      }
    }

    if (event is RefreshWeatherEvent) {
      try {
        final Weather weather = await repo.getWeather(event.city);
        yield WeatherLoaded(weather: weather);
      } catch (_) {
        yield WeatherError();
      }
    }
  }

}

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class FetchWeatherEvent extends WeatherEvent {

  final String city;

  FetchWeatherEvent({@required this.city}): assert(city != null);

  @override
  List<Object> get props => [city];

}


class RefreshWeatherEvent extends WeatherEvent {
  final String city;

  RefreshWeatherEvent(this.city);

  @override
  List<Object> get props => [city];
}

