import 'package:flutter_app/weather/api/weather_api_client.dart';
import 'package:flutter_app/weather/models/models.dart';

class Repository {
  final WeatherApiClient apiClient;

  Repository(this.apiClient);

  Future<Weather> getWeather(String city) async {
    final id = await apiClient.getLocationId(city);
    return apiClient.fetchWeather(id);
  }
}
