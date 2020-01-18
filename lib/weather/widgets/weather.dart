import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/weather/blocs/blocs.dart';
import 'package:flutter_app/weather/widgets/combine_weather_temperature.dart';
import 'package:flutter_app/weather/widgets/last_updated.dart';
import 'package:flutter_app/weather/widgets/location.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherApp extends StatefulWidget {
  final String title;

  const WeatherApp({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyWeatherAppState();
  }
}

class MyWeatherAppState extends State<WeatherApp> {
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeatherBloc>(context)
        .add(FetchWeatherEvent(city: "Taipei"));
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocListener<WeatherBloc, WeatherState>(
        listener: (context, state) {
          print(state);
          _refreshCompleter?.complete();
          _refreshCompleter = Completer();
        },
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            print("QQQ////$state");
            if (state is WeatherLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is WeatherLoaded) {
              final weather = state.weather;

              return ListView(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: Location(
                      location: weather.location,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: LastUpdated(
                      dateTime: weather.lastUpdated,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CombinedWeatherTemperature(
                    weather: weather,
                  )
                ],
              );
            }

            return Center(
              child: Text("123"),
            );
          },
        ),
      ),
    );
  }
}
