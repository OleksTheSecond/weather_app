import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/weather/data/data_sources/remote/weather_api_service.dart';
import 'package:weather_app/features/weather/data/repository/coordinates_repo_impl.dart';
import 'package:weather_app/features/weather/data/repository/current_weather_repo_impl.dart';
import 'package:weather_app/features/weather/domain/repository/coordinates_repo.dart';
import 'package:weather_app/features/weather/domain/repository/current_weather_repo.dart';
import 'package:weather_app/features/weather/domain/usecases/get_current_weather.dart';
import 'package:weather_app/features/weather/presentation/bloc/current_weather/current_weather_bloc.dart';

final locator = GetIt.instance;

Future<void> initDependencies() async {
  locator.registerSingleton<Dio>(Dio());
  locator.registerSingleton<WeatherAPIService>(WeatherAPIService(locator()));
  locator.registerSingleton<CurrentWeatherRepository>(
      CurrentWeatherRepositoryImpl(locator()));
  locator.registerSingleton<CoordinatesRepository>(CoordinatesRepositoryImpl());
  locator.registerSingleton<GetCurrentWeatherUseCase>(
      GetCurrentWeatherUseCase(locator(), locator()));

  locator
      .registerFactory<CurrentWeatherBloc>(() => CurrentWeatherBloc(locator()));

  locator
      .registerFactory<LoactionException>(() => LoactionException(locator()));
}
