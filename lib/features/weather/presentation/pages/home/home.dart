import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/features/weather/presentation/bloc/current_weather/current_weather_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/current_weather/current_weather_event.dart';
import 'package:weather_app/features/weather/presentation/bloc/current_weather/current_weather_state.dart';
import 'package:weather_app/injection_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Current Weather"),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<CurrentWeatherBloc>(context)
                  .add(GetCurrentWeather());
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
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
              Lottie.asset(
                  "assets/lotti_animations/${data.weather[0].icon}.json"),
              Text(
                "Temperature ${data.main.temp.toString()}°C",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "Temperature feels like ${data.main.feelsLike.toString()}°C",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "Time ${DateTime.fromMillisecondsSinceEpoch(data.time! * 1000).hour}:${DateTime.fromMillisecondsSinceEpoch(data.time! * 1000).minute}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
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
