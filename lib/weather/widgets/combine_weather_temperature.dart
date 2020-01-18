import 'package:flutter/material.dart';
import 'package:flutter_app/weather/models/models.dart' as model;
import 'package:flutter_app/weather/widgets/weather_conditions.dart';

class CombinedWeatherTemperature extends StatelessWidget {
  final model.Weather weather;

  CombinedWeatherTemperature({Key key, @required this.weather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: WeatherConditions(condition: weather.condition),
            )
          ],
        ),
        //todo 20200107 work in progress Temperature
        Center(
          child: Text(
            weather.formattedCondition,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w200,
              color: Colors.black
            ),
          ),
        )
      ],
    );
  }
}
