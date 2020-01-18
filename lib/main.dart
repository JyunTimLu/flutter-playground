// This sample shows adding an action to an [AppBar] that opens a shopping cart.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/expired_remind/home_page.dart';
import 'package:flutter_app/grid_view/grid_view_page.dart';
import 'package:flutter_app/login/login_page.dart';
import 'package:flutter_app/on_boarding/on_boarding_page.dart';
import 'package:provider/provider.dart';

final controller = StreamController<bool>.broadcast();

void main() => runApp(MaterialApp(
      theme: ThemeData(
        accentColor: Colors.amberAccent,
        primaryColor: Colors.amberAccent,
        primaryColorDark: Colors.amber,
      ),
      home: HomeApp(),
      debugShowCheckedModeBanner: false,
    ));

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
                            stream: controller.stream,
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyLoginApp()));
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BoardingApp()));
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GridViewApp()));
                print("click expire");
              },
              child: Text(
                "Grid View",
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
