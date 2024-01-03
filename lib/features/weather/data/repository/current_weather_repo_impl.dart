import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/weather/data/models/current_weather.dart';
import 'package:weather_app/features/weather/domain/repository/current_weather_repo.dart';

class CurrentWeatherRepositoryImpl extends CurrentWeatherRepository {
  @override
  Future<DataState<CurrentWeatherModel>> getCurrentWeather() {
    // TODO: implement getCurrentWeather
    throw UnimplementedError();
  }
}
