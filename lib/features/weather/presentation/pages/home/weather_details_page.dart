import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_details_page_widgets/weather_location_card.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_details_page_widgets/weather_main_details_card.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_details_page_widgets/weather_visibility_card.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_details_page_widgets/weather_wind_card.dart';

class WeatherDetailsPage extends StatelessWidget {
  final CurrentWeatherEntity weather;
  final String title;

  const WeatherDetailsPage({
    super.key,
    required this.weather,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final time = DateTime.fromMillisecondsSinceEpoch(weather.time! * 1000);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WeatherLocationCard(
                weather: weather.weather[0],
                cityName: weather.cityName == null ? "" : weather.cityName!,
                time: time),
            WeatherMainDetailsCard(main: weather.main, title: 'Main details'),
            if (weather.visibility != null)
              WeatherVisibilityCard(
                  visibility: weather.visibility!, title: 'Visibility'),
            WeatherWindCard(wind: weather.wind, title: 'Wind'),
          ],
        ),
      ),
    );
  }
}
