import 'package:flutter/material.dart';
import 'package:flutter_app/0to1/routes/page1.dart';

class RoutesApp extends StatelessWidget {
  const RoutesApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.amberAccent,
        primaryColor: Colors.amberAccent,
        primaryColorDark: Colors.amber,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Route App'),
          ),
          body: HomePage1()),
    );
  }
}
