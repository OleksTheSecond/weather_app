import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather.dart';
import 'package:weather_app/features/weather/presentation/bloc/current_weather/current_weather_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/current_weather/current_weather_event.dart';
import 'package:weather_app/features/weather/presentation/bloc/current_weather/current_weather_state.dart';
import 'package:weather_app/features/weather/presentation/pages/home/weather_details_page.dart';
import 'package:weather_app/injection_container.dart';

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

  _buildLoadingState() {
    return const Center(
      child: CircularProgressIndicator(
        strokeWidth: 5,
      ),
    );
  }

  _buildException(String message) {
    return Center(
      child: Text(message),
    );
  }

  _buildWeatherLoaded(CurrentWeatherEntity data, BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            data.weather[0].main.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          Hero(
            tag: 'weather_lottie',
            child: Lottie.asset(
                "assets/lottie_animations/${data.weather[0].icon}.json"),
          ),
          Text(
            "Temperature ${data.main.temp.toString()}°C",
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          CupertinoButton(
            color: Theme.of(context).colorScheme.primary,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => WeatherDetailsPage(
                    title: "Current Weather",
                    weather: data,
                  ),
                ),
              );
            },
            child: const Text(
              'Tap for details',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  _buildBody(BuildContext context) {
    return BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case CurrentWeatherLoading:
            return _buildLoadingState();
          case CurrentWeatherApiException:
            return _buildException(state.apiException!.message.toString());
          case CurrentWeatherLocationException:
            return _buildException(state.loactionException!.message.toString());
          case CurrentWeatherLoaded:
            final data = state.currentWeather;
            if (data != null) {
              return _buildWeatherLoaded(data, context);
            }
          default:
            return Container(
              color: Colors.red,
            );
        }
        return Container(
          color: Colors.red,
        );
      },
    );
  }
}
