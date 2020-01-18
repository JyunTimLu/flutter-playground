import 'dart:convert';

import 'package:http/http.dart';

Future<List<Map>> fetchData() async {
  String url =
      "http://data.coa.gov.tw/Service/OpenData/FromM/FarmTransData.aspx";
  final response = await get(url);
  final data = response.body;
  final List<Map> jsonData = List<Map>.from(json.decode(data));
  return jsonData;
}
