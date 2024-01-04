import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/current_weather/current_weather_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/current_weather/current_weather_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Current Weather")),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
      builder: (_, state) {
        if (state is CurrentWeatherLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CurrentWeatherApiException) {
          return Center(
            child: Text(state.apiException!.error.toString()),
          );
        }
        if (state is CurrentWeatherLocationException) {
          return Center(
            child: Text(state.loactionException!.message!),
          );
        }
        if (state is CurrentWeatherLoaded) {
          final data = state.currentWeather;
          return Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(data!.cityName!),
              Text(data.main.temp.toString()),
              Text(data.main.feelsLike.toString()),
            ]),
          );
        }
        return Container(
          color: Colors.red,
        );
      },
    );
  }
}
