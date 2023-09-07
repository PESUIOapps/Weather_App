import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherController {
  final WeatherModel weatherModel = WeatherModel();

  Future<void> fetchWeatherData(String city) async {
    final apikey = '32a246cfad6a131fdfdec11376094e1b';
    final apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apikey&units=metric';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      weatherModel.cityName = result['name'];
      weatherModel.temperature = result['main']['temp'].toString();
      weatherModel.iconUrl =
          'http://openweathermap.org/img/w/${result['weather'][0]['icon']}.png';
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
