import 'dart:io';
import 'package:dio/dio.dart';
import 'package:weather_app/core/constants/constants.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/weather/data/data_sources/remote/weather_api_service.dart';
import 'package:weather_app/features/weather/data/models/current_weather.dart';
import 'package:weather_app/features/weather/domain/entities/coordinates.dart';
import 'package:weather_app/features/weather/domain/repository/current_weather_repo.dart';

class CurrentWeatherRepositoryImpl extends CurrentWeatherRepository {
  final WeatherAPIService _apiService;

  CurrentWeatherRepositoryImpl(this._apiService);

  @override
  Future<DataState<CurrentWeatherModel>> getCurrentWeather(
      DataState<CoordinatesEntity> coordinates) async {
    if (coordinates is DataLocationException) {
      return DataLocationException(coordinates.loactionException!);
    }

    try {
      final httpResponse = await _apiService.getCurrentWeather(
        apiKey: apiKey,
        units: units,
        latitude: coordinates.data?.latitude.toString(),
        longitude: coordinates.data?.longitude.toString(),
        lang: lang,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataApiException(DioException(
          requestOptions: httpResponse.response.requestOptions,
          response: httpResponse.response,
          error: httpResponse.response.statusMessage,
        ));
      }
    } on DioException catch (e) {
      return DataApiException(e);
    }
  }
}
