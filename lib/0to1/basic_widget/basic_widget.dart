import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'DemoText  a lot of text',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class MyIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.account_circle);
  }
}

class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network("https://thethreatreport.com/wp-content/uploads/2019/05/What-Can-Make-You-Decide-iOS-vs-Android.jpg");
  }
}
