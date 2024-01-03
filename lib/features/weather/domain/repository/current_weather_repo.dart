import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather.dart';

abstract class CurrentWeatherRepository {
  Future<DataState<CurrentWeatherEntity>> getCurrentWeather();
}
