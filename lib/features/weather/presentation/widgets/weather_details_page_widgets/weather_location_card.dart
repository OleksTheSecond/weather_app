import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_details_page_widgets/weather_card.dart';

class WeatherLocationCard extends StatelessWidget {
  final WeatherEntity weather;
  final String cityName;
  final DateTime time;

  const WeatherLocationCard({
    super.key,
    required this.weather,
    required this.cityName,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final descriptionLine =
        '${weather.description![0].toUpperCase()}${weather.description!.substring(1).toLowerCase()}';
    final cityLine = cityName.isEmpty ? '' : 'in $cityName';
    return WeatherCard(
      child: ListTile(
        title: Text(weather.main!),
        subtitle:
            Text('$descriptionLine $cityLine at ${time.hour}:${time.minute}'),
        trailing: Hero(
          tag: 'weather_lottie',
          child: Lottie.asset("assets/lottie_animations/${weather.icon}.json"),
        ),
      ),
    );
  }
}
