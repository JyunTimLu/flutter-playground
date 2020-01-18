import 'package:flutter/material.dart';

class Temperature extends StatelessWidget {
  final double temperature;
  final double high;
  final double low;
  final String unit;

  const Temperature(
      {Key key,
      @required this.temperature,
      @required this.high,
      @required this.low,
      @required this.unit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '$temperature',
          style: TextStyle(
              color: Colors.black, fontSize: 32, fontWeight: FontWeight.w600),
        ),
        Column(
          children: <Widget>[
            Text(
              'max: ${(high)}°',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w100,
                color: Colors.black,
              ),
            ),
            Text('min: ${(low)}°',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                  color: Colors.black,
                ))
          ],
        )
      ],
    );
  }

  int _toFahrenheit(double celsius) => ((celsius * 9 / 5) + 32).round();

}
