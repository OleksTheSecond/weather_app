import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/core/usecases/usecase.dart';
import 'package:weather_app/features/weather/data/repository/current_weather_repo_impl.dart';
import 'package:weather_app/features/weather/domain/entities/coordinates.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather.dart';
import 'package:weather_app/features/weather/domain/repository/coordinates_repo.dart';
import 'package:weather_app/features/weather/domain/repository/current_weather_repo.dart';

class GetCurrentWeatherUseCase
    implements UseCase<DataState<CurrentWeatherEntity>, void> {
  final CurrentWeatherRepository _currentWeatherRepository;
  final CoordinatesRepository _coordinatesRepository;

  GetCurrentWeatherUseCase(
      this._currentWeatherRepository, this._coordinatesRepository);

  Future<DataState<CoordinatesEntity>> getCoordinates() async {
    return await _coordinatesRepository.getLocation();
  }

  @override
  Future<DataState<CurrentWeatherEntity>> call({params}) async {
    return _currentWeatherRepository.getCurrentWeather(await getCoordinates());
  }
}
