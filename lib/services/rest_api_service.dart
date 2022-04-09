import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ranks_admission_test/constants/api_path.dart';
import 'package:ranks_admission_test/constants/app_constants.dart' as constants;
import 'package:ranks_admission_test/models/weather.dart';

class WeatherApiService {
  Future<WeatherModel> getWeather(
    double lat,
    double lng,
  ) async {
    var now = DateTime.now().toUtc();
    int secondsSinceEpoch =
        now.millisecondsSinceEpoch ~/ Duration.millisecondsPerSecond;

    var dt = secondsSinceEpoch;
    print(dt);
    final response = await http.get(
      Uri.parse(apiUrl +
          "&lat=" +
          lat.toString() +
          "&lon=" +
          lng.toString() +
          "&lang=" +
          constants.language +
          "&units=" +
          constants.metrics +
          "&dt=" +
          dt.toString() +
          "&appid=fbfd73be04a8bbc801352408a66e6f7a"),
    );
    print(response.body);
    print(jsonDecode(response.body)['current']);
    var weather = WeatherModel.fromJson(jsonDecode(response.body)['current']);
    var weatherType =
        jsonDecode(response.body)['current']['weather'][0]['description'];
    print(weatherType);
    weather.weatherType = weatherType;
    return weather;
    // } else {
    //   // If the server did not return a 200 OK response,
    //   // then throw an exception.
    //   throw Exception('Failed to load Weather');
    // }
  }

  fetchCitiesWeather() async {
    List<WeatherModel> citiesWeather = [];
    constants.streamController = StreamController.broadcast();
    for (String element in constants.cities!) {
      WeatherModel weather = await WeatherApiService().getWeather(
        constants.locations[element][0],
        constants.locations[element][1],
      );
      weather.city = element;
      weather.iconUrl = 'assets/sun.svg';
      weather.image = 'assets/night.jpg';
      citiesWeather.add(weather);
      constants.streamController.sink.add(citiesWeather);
    }
  }
}
