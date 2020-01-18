import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/weather/bloc/weather/weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherApp extends StatefulWidget {
  final String title;

  const WeatherApp({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WeatherState();
  }
}

class WeatherState extends State<WeatherApp> {
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
//      body: BlocListener(listener: (context, state) {
////        if (state == WeatherLoading) {
////          BlocProvider.of(context).add()
////        }
////        print(state);
//
//      }),
    );
  }
}
