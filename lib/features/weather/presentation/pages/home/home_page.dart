import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/current_weather/current_weather_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/current_weather/current_weather_event.dart';
import 'package:weather_app/features/weather/presentation/bloc/current_weather/current_weather_state.dart';
import 'package:weather_app/features/weather/presentation/widgets/home_page_widgets/exception_message.dart';
import 'package:weather_app/features/weather/presentation/widgets/home_page_widgets/loading_indicator.dart';
import 'package:weather_app/features/weather/presentation/widgets/home_page_widgets/weather_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Current Weather"),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<CurrentWeatherBloc>(context)
                  .add(const AwaitCurrentWeather());
              BlocProvider.of<CurrentWeatherBloc>(context)
                  .add(const GetCurrentWeather());
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case CurrentWeatherLoading:
            return const LoadingIndicator();
          case CurrentWeatherApiException:
            return ExceptionMessage(
                message: state.apiException!.message.toString());
          case CurrentWeatherLocationException:
            return ExceptionMessage(
                message: state.loactionException!.message.toString());
          case CurrentWeatherLoaded:
            final data = state.currentWeather;
            if (data != null) {
              return WeatherBody(data: data);
            }
        }
        return const ExceptionMessage(
            message: 'Something go wrong, contact develeper');
      },
    );
  }
}
