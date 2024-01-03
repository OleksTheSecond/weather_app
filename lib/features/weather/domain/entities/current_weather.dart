import 'package:weather_app/features/weather/domain/entities/clouds.dart';
import 'package:weather_app/features/weather/domain/entities/coordinates.dart';
import 'package:weather_app/features/weather/domain/entities/main_description.dart';
import 'package:weather_app/features/weather/domain/entities/system_params.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';
import 'package:weather_app/features/weather/domain/entities/wind.dart';
import 'package:equatable/equatable.dart';

class CurrentWeather extends Equatable {
  const CurrentWeather({
    required this.coordinates,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.time,
    required this.sys,
    required this.timezone,
    required this.cityId,
    required this.cityName,
    required this.cod,
  });
  final CoordinatesEntity coordinates;
  final List<WeatherEntity> weather;
  final String base;
  final MainDescriptionEntity main;
  final int visibility;
  final WindEntity wind;
  final CloudsEntity clouds;
  final int time;
  final SystemParamsEntity sys;
  final int timezone;
  final int cityId;
  final String cityName;
  final int cod;

  @override
  List<Object?> get props {
    return [
      coordinates,
      weather,
      base,
      main,
      visibility,
      wind,
      clouds,
      time,
      sys,
      timezone,
      cityId,
      cityName,
      cod
    ];
  }
}
