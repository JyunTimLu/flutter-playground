import 'package:flutter/material.dart';
import 'package:flutter_app/weather/models/models.dart';

class WeatherConditions extends StatelessWidget {
  final WeatherCondition condition;

  WeatherConditions({Key key, @required this.condition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _mapConditionToImage(condition);
  }

  Icon _mapConditionToImage(WeatherCondition condition) {
    return Icon(
      Icons.event,
      color: Colors.black,
    );
  }
}
