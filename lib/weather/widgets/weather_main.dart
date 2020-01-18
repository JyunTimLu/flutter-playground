import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/weather/api/api.dart';
import 'package:flutter_app/weather/api/repository.dart';
import 'package:flutter_app/weather/widgets/weather.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/blocs.dart';

class MyWeatherApp extends StatelessWidget {
  final Repository repo;

  const MyWeatherApp({Key key, @required this.repo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(repo),
      child: WeatherApp(
        title: "Title",
      ),
    );
  }
}
