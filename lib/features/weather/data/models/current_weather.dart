import 'package:weather_app/features/weather/data/models/clouds.dart';
import 'package:weather_app/features/weather/data/models/coordinates.dart';
import 'package:weather_app/features/weather/data/models/main_description.dart';
import 'package:weather_app/features/weather/data/models/system_params.dart';
import 'package:weather_app/features/weather/data/models/weather.dart';
import 'package:weather_app/features/weather/data/models/wind.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather.dart';

class CurrentWeatherModel extends CurrentWeatherEntity {
  const CurrentWeatherModel({
    required super.coordinates,
    required super.weather,
    required super.base,
    required super.main,
    required super.visibility,
    required super.wind,
    required super.clouds,
    required super.time,
    required super.sys,
    required super.timezone,
    required super.cityId,
    required super.cityName,
    required super.cod,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
      coordinates: CoordinatesModel.fromJson(json['coord']),
      weather: List.from(json['weather'])
          .map((e) => WeatherModel.fromJson(e))
          .toList(),
      base: json['base'],
      main: MainDescriptionModel.fromJson(json['main']),
      visibility: json['visibility'],
      wind: WindModel.fromJson(json['wind']),
      clouds: CloudsModel.fromJson(json['clouds']),
      time: json['dt'],
      sys: SystemParamsModel.fromJson(json['sys']),
      timezone: json['timezone'],
      cityId: json['id'],
      cityName: json['name'],
      cod: json['cod'],
    );
  }
}
