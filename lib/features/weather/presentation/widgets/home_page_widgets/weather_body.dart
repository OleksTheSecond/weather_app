import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather.dart';
import 'package:weather_app/features/weather/presentation/pages/home/weather_details_page.dart';
import 'package:weather_app/features/weather/presentation/widgets/home_page_widgets/details_button.dart';

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key, required this.data});
  final CurrentWeatherEntity data;

  @override
  Widget build(BuildContext context) {
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
          DetailsButton(
            text: 'Tap for details',
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
          ),
        ],
      ),
    );
  }
}
