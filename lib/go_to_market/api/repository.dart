import 'dart:convert';

import 'package:http/http.dart';

class MarketRepo {
  String url =
      "http://data.coa.gov.tw/Service/OpenData/FromM/FarmTransData.aspx";

  Future<List<Map>> fetchData() async {
    final response = await get(url);
    final data = response.body;
    return List<Map>.from(json.decode(data));
  }
}
