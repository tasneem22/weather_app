import 'dart:async';

import 'package:ranks_admission_test/models/weather.dart';

String metrics = 'standard', language = 'en';

Map<String, String> unitsLabels = {
  "standard": 'Kelvin & meter/sec',
  "imperial": 'Fahrenheit & miles/hour',
  "metric": 'Celsius & meter/sec'
};

Map<String, String> languages = {
  'en': 'English',
  'ru': 'Russian',
};
List<String>? cities;
Map<String, dynamic> locations = {
  'Cairo': [30.0444, 31.2357],
  'Kazan': [55.796391, 49.1233],
  'New York': [40.7128, 74.0060],
  'Moscow': [55.7558, 37.6173],
  'Suchi': [36.7783, 119.4179],
};
Map<String, String> temperatureSymbols = {
  "standard": '\u212A',
  "imperial": '\u2109',
  "metric": '\u2103',
};
// it stores cities' call given city name, for example:
/**
 * "cairo":{
 * "time" : 12849012
 * "weather": 23
 * "sunset>= current && current <= sunrise": "night" or day
 * wind_speed
 * humidity
 * rain
 * }
 * }
 */
Map<String, Map<String, dynamic>> cityCall = {};

// city [lat, lng]
List<Map<String, dynamic>> cityLocation = locations.entries
    .map((e) => <String, dynamic>{
          'city': e.key,
          'coord': e.value,
        })
    .toList();
late StreamController<List<WeatherModel>> streamController;
