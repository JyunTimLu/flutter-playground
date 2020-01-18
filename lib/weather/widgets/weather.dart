import 'dart:async';

import 'package:flutter/material.dart';



class WeatherApp extends StatefulWidget {
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
    return Container();
  }

}