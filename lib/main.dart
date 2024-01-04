import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/current_weather/current_weather_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/current_weather/current_weather_event.dart';
import 'package:weather_app/features/weather/presentation/pages/home/home.dart';
import 'package:weather_app/injection_container.dart';

void main() async {
  await initDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CurrentWeatherBloc>(
      create: (context) => locator()..add(const GetCurrentWeather()),
      child: MaterialApp(
        theme: ThemeData(fontFamily: "Poppins"),
        home: const HomePage(),
      ),
    );
  }
}
