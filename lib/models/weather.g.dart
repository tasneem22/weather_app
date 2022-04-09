// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      city: json['city'] as String?,
      dateTime: json['dt'] as int?,
      temperature: json['temp'] as double,
      weatherType: json['weatherType'] as String,
      wind: json['wind_speed'] as double,
      humidity: json['humidity'] as int,
      sunrise: json['sunrise'] as int,
      sunset: json['sunset'] as int,
    )..lastCallTime = json['lastCallTime'] as int?;

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'city': instance.city,
      'dt': instance.dateTime,
      'temp': instance.temperature,
      'wind_speed': instance.wind,
      'weatherType': instance.weatherType,
      'iconUrl': instance.iconUrl,
      'rain': instance.rain,
      'humidity': instance.humidity,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'lastCallTime': instance.lastCallTime,
    };
