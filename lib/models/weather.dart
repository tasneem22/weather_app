import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class WeatherModel {
  String? city;
  @JsonKey(name: 'dt')
  final int? dateTime;
  @JsonKey(name: 'temp')
  final double temperature;
  @JsonKey(name: 'wind_speed')
  final double wind;
  String? weatherType;
  String? iconUrl;
  String? image;
  double? rain;
  final int humidity;
  final int sunrise, sunset;
  int? lastCallTime;
  //
  WeatherModel({
    this.city,
    this.dateTime,
    required this.temperature,
    this.weatherType,
    required this.wind,
    required this.humidity,
    required this.sunrise,
    required this.sunset,
  });
  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}

// final locationList = [
//   WeatherModel(
//     city: 'Kolkata',
//     // dateTime: '07:50 PM — Monday, 9 Nov 2020',
//     temperature: 24,
//     weatherType: 'Night',
//     iconUrl: 'assets/moon.svg',
//     wind: 10,
//     humidity: 10,
//     sunrise: 1586487424,
//     sunset: 1586538297,
//   ),
//   WeatherModel(
//     city: 'London',
//     // dateTime: '02:20 PM — Monday, 9 Nov 2020',
//     temperature: 15,
//     weatherType: 'Cloudy',
//     iconUrl: 'assets/cloudy.svg',
//     wind: 8,
//     humidity: 82,
//     sunrise: 1586487424,
//     sunset: 1586538297,
//   ),
//   WeatherModel(
//     city: 'New York',
//     // dateTime: '09:20 AM — Monday, 9 Nov 2020',
//     temperature: 17,
//     weatherType: 'Sunny',
//     iconUrl: ,
//     wind: 5,
//     humidity: 61,
//     sunrise: 1586487424,
//     sunset: 1586538297,
//   ),
//   WeatherModel(
//     city: 'Sydney',
//     // dateTime: '01:20 AM — Tuesday, 10 Nov 2020',
//     temperature: 10,
//     weatherType: 'Rainy',
//     iconUrl: 'assets/rain.svg',
//     wind: 20,
//     humidity: 91,
//     sunrise: 1586487424,
//     sunset: 1586538297,
//   ),
// ];
