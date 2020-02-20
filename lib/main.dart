// This sample shows adding an action to an [AppBar] that opens a shopping cart.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/0to1/main.dart';
import 'package:flutter_app/expired_remind/home_page.dart';
import 'package:flutter_app/go_to_market/go_to_market.dart';
import 'package:flutter_app/grid_view/grid_view_page.dart';
import 'package:flutter_app/login/login_page.dart';
import 'package:flutter_app/on_boarding/on_boarding_page.dart';
import 'package:flutter_app/parallax_page_view/main.dart';
import 'package:flutter_app/tic_tac_toe/main.dart';
import 'package:flutter_app/weather/api/repository.dart';
import 'package:flutter_app/weather/api/weather_api_client.dart';
import 'package:flutter_app/weather/blocs/blocs.dart';
import 'package:flutter_app/weather/widgets/weather_main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

final controller = StreamController<bool>.broadcast();

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.amberAccent,
        primaryColor: Colors.amberAccent,
        primaryColorDark: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "reminder": (context) {
          return StreamProvider.value(
              initialData: false,
              value: controller.stream,
              child: MyExpiredRemindApp());
        },
        "login": (context) => MyLoginApp(),
        "boarding": (context) => BoardingApp(),
        "gridView": (context) => GridViewApp(),
        "goToMarket": (context) => MyGoToMarketApp(),
        "zeroToOne": (context) => ZeroToOne(),
        'ticTacToe': (context) => MyTicTacToeApp(),
        'parallaxPageView': (context) => MyParallaxPageView()
      },
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  final weatherRepo = Repository(WeatherApiClient(httpClient: http.Client()));

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
                Navigator.pushNamed(context, "reminder");
              },
              child: Text(
                "ExpireRemindPage",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "login");
              },
              child: Text(
                "Login Page",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "boarding");
              },
              child: Text(
                "On boarding page",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "gridView");
              },
              child: Text(
                "Grid View",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "goToMarket");
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
                            MyWeatherApp(repo: widget.weatherRepo)));
              },
              child: Text(
                "Go to weather",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "zeroToOne");
              },
              child: Text(
                "Zero to One",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "ticTacToe");
              },
              child: Text(
                "ticTacToe",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, "parallaxPageView");
              },
              child: Text(
                "p",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
