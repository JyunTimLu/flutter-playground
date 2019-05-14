// This sample shows adding an action to an [AppBar] that opens a shopping cart.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/expired_remind/home_page.dart';
import 'package:provider/provider.dart';

final controller = StreamController<bool>();

void main() => runApp(MaterialApp(
      theme: ThemeData(
        accentColor: Colors.amberAccent,
        primaryColor: Colors.amberAccent,
        primaryColorDark: Colors.amber,
      ),
      home: StreamProvider.value(
        initialData: false,
        stream: controller.stream,
        child: MyExpiredRemindApp(),
      ),
      debugShowCheckedModeBanner: false,
    ));
