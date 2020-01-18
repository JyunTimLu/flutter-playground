// This sample shows adding an action to an [AppBar] that opens a shopping cart.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/expired_remind/home_page.dart';
import 'package:flutter_app/go_to_market/go_to_market.dart';
import 'package:flutter_app/grid_view/grid_view_page.dart';
import 'package:flutter_app/login/login_page.dart';
import 'package:flutter_app/on_boarding/on_boarding_page.dart';
import 'package:flutter_app/weather/api/repository.dart';
import 'package:flutter_app/weather/api/weather_api_client.dart';
import 'package:flutter_app/weather/bloc/bloc_delegate.dart';
import 'package:flutter_app/weather/widgets/weather.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

final controller = StreamController<bool>.broadcast();

void main() {
  Repository(WeatherApiClient(httpClient: http.Client()));

  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(MaterialApp(
    theme: ThemeData(
      accentColor: Colors.amberAccent,
      primaryColor: Colors.amberAccent,
      primaryColorDark: Colors.amber,
    ),
    home: HomeApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomeApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomeAppState();
  }
}

class _MyHomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Playground"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StreamProvider.value(
                            initialData: false,
                            value: controller.stream,
                            child: MyExpiredRemindApp())));
                print("click expire");
              },
              child: Text(
                "ExpireRemindPage",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyLoginApp()));
                print("click expire");
              },
              child: Text(
                "Login Page",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BoardingApp()));
                print("click expire");
              },
              child: Text(
                "On boarding page",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GridViewApp()));
                print("click expire");
              },
              child: Text(
                "Grid View",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MyGoToMarketApp(title: "go to market")));
                print("click expire");
              },
              child: Text(
                "Go to market",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            WeatherApp(title: "go to market")));
                print("click expire");
              },
              child: Text(
                "Go to weather",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
