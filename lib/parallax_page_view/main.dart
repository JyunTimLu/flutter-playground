import 'package:flutter/material.dart';

class MyParallaxPageView extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        child: titleCaintainer,
      )),
    );
  }
}
