import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/0to1/basic_widget/basic_widget.dart';

class ZeroToOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("0 to 1"),
      ),
      body: Column(
        children: [
          MyText(),
          MyIcon(),
          MyImage(),
          FlutterLogo(
            textColor: Colors.amber,
            size: 100.0,
          ),
          Text(generateMD5("Jake20200123")),
        ],
      ),
    );
  }
}

String generateMD5(String s) {
  final content = Utf8Encoder().convert(s);
  final digest = md5.convert(content);
  return digest.toString();
}
