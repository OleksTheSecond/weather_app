import 'package:flutter/material.dart';
import 'package:weather_app/config/theme/app_theme.dart';
import 'package:weather_app/features/weather/domain/entities/main_description.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_details_page_widgets/weather_card.dart';

class WeatherMainDetailsCard extends StatelessWidget {
  final MainDescriptionEntity main;
  final String title;

  const WeatherMainDetailsCard({
    super.key,
    required this.main,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return WeatherCard(
      child: ListTile(
        title: Padding(
          padding: AppTheme.paddingsInCard,
          child: Text(title),
        ),
        subtitle: Column(
          children: [
            if (main.temp != null)
              _buildDetail("Temperature: ", "${main.temp}°C"),
            if (main.feelsLike != null)
              _buildDetail('Temperature feels like: ', "${main.feelsLike}°C"),
            if (main.pressure != null)
              _buildDetail('Pressure: ', '${main.pressure} hPa'),
            if (main.seaLevel != null)
              _buildDetail('Sea level pressure: ', '${main.seaLevel} hPa'),
            if (main.grndLevel != null)
              _buildDetail('Ground level pressure: ', '${main.grndLevel} hPa'),
            if (main.humidity != null)
              _buildDetail('Humidity: ', '${main.humidity} %'),
          ],
        ),
      ),
    );
  }

  Widget _buildDetail(String detailName, String detail) {
    return Padding(
      padding: AppTheme.paddingsInCard,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(detailName),
          Text(detail),
        ],
      ),
    );
  }
}
