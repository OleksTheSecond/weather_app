import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather.dart';

abstract class CurrentWeatherState extends Equatable {
  final CurrentWeatherEntity? currentWeather;
  final DioException? apiException;
  final LoactionException? loactionException;

  const CurrentWeatherState(
      {this.currentWeather, this.apiException, this.loactionException});

  @override
  List<Object> get props =>
      [currentWeather!, apiException!, loactionException!];
}

class CurrentWeatherLoading extends CurrentWeatherState {
  const CurrentWeatherLoading();
}

class CurrentWeatherLoaded extends CurrentWeatherState {
  const CurrentWeatherLoaded(CurrentWeatherEntity currentWeatherEntity)
      : super(currentWeather: currentWeatherEntity);
}

class CurrentWeatherApiException extends CurrentWeatherState {
  const CurrentWeatherApiException(DioException exception)
      : super(apiException: exception);
}

class CurrentWeatherLocationException extends CurrentWeatherState {
  const CurrentWeatherLocationException(LoactionException exception)
      : super(loactionException: exception);
}
