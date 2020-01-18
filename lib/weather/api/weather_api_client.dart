import 'dart:convert';

import 'package:flutter_app/weather/model/weather.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  static const baseUrl = 'https://www.metaweather.com/api/location/';
  final http.Client httpClient;

  WeatherApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<int> getLocationId(String city) async {
    final requestUrl = '${baseUrl}search/?query=$city';
    final response = await this.httpClient.get(requestUrl);
    if (response.statusCode != 200) {
      throw Exception("error getting location id");
    }

    final locationJson = jsonDecode(response.body) as List;
    return locationJson.first['woeid'];
  }

  Future<Weather> fetchWeather(int locationId) async {
    final requestUrl = "$baseUrl$locationId";
    final response = await this.httpClient.get(requestUrl);

    if (response.statusCode != 200) {
      throw Exception("error fetch weather");
    }

    return Weather.fromJson(jsonDecode(response.body));
  }
}
