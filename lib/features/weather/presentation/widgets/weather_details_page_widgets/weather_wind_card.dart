import 'package:flutter/material.dart';
import 'package:weather_app/config/theme/app_theme.dart';
import 'package:weather_app/features/weather/domain/entities/wind.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_details_page_widgets/weather_card.dart';

class WeatherWindCard extends StatelessWidget {
  final WindEntity wind;
  final String title;

  const WeatherWindCard({
    super.key,
    required this.wind,
    required this.title,
  });

  _windDetail(String detailName, String detail) {
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
            if (wind.speed != null)
              _windDetail('Speed: ', '${wind.speed.toString()} m/s'),
            if (wind.deg != null) _windDetail('Degrees: ', wind.deg.toString()),
            if (wind.gust != null)
              _windDetail('Gust: ', '${wind.gust.toString()} m/s'),
          ],
        ),
      ),
    );
  }
}
