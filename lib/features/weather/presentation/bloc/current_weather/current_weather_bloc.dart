import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/weather/domain/usecases/get_current_weather.dart';
import 'package:weather_app/features/weather/presentation/bloc/current_weather/current_weather_event.dart';
import 'package:weather_app/features/weather/presentation/bloc/current_weather/current_weather_state.dart';

class CurrentWeatherBloc
    extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
  final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;

  CurrentWeatherBloc(this._getCurrentWeatherUseCase)
      : super(const CurrentWeatherLoading()) {
    on<GetCurrentWeather>(_onGetWeather);
  }

  void _onGetWeather(
      GetCurrentWeather event, Emitter<CurrentWeatherState> emitter) async {
    final data = await _getCurrentWeatherUseCase();
    if (data is DataSuccess) {
      emit(CurrentWeatherLoaded(data.data!));
    }
    if (data is DataApiException) {
      emit(CurrentWeatherApiException(data.apiException!));
    }
    if (data is DataLocationException) {
      emit(CurrentWeatherLocationException(data.loactionException!));
    }
  }
}
