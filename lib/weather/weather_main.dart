import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/weather/api/repository.dart';
import 'package:flutter_app/weather/bloc/weather/weather_bloc.dart';
import 'package:flutter_app/weather/model/weather.dart';
import 'package:flutter_app/weather/widgets/weather.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyWeatherApp extends StatelessWidget {
  final Repository repo;

  const MyWeatherApp({Key key, this.repo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(repo),
      child: WeatherApp(),
    );
  }
}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}