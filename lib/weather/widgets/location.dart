import 'package:flutter/material.dart';

class Location extends StatelessWidget {

  final String location;

  const Location({Key key, @required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      location,
      style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.black
      ),
    );
  }

}