import 'package:retrofit/retrofit.dart';
import 'package:weather_app/core/constants/constants.dart';
import 'package:weather_app/features/weather/data/models/current_weather.dart';
import 'package:dio/dio.dart';
part 'weather_api_service.g.dart';

@RestApi(baseUrl: weatherURL)
abstract class WeatherAPIService {
  factory WeatherAPIService(Dio dio) = _WeatherAPIService;

  @GET('/weather')
  Future<HttpResponse<CurrentWeatherModel>> getCurrentWeather({
    @Query('lat') String? latitude,
    @Query('lon') String? longitude,
    @Query('appid') String? apiKey,
    @Query('units') String? units,
    @Query('lang') String? lang,
  });
}
