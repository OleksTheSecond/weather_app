import 'package:flutter/material.dart';
import 'package:weather_app/config/theme/app_theme.dart';
import 'package:weather_app/features/weather/presentation/widgets/weather_details_page_widgets/weather_card.dart';

class WeatherVisibilityCard extends StatelessWidget {
  final int visibility;
  final String title;

  const WeatherVisibilityCard({
    super.key,
    required this.visibility,
    required this.title,
  });

  _buildVisibilityIteme() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$title: '),
        Text('$visibility meters'),
      ],
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
        subtitle: Padding(
          padding: AppTheme.paddingsInCard,
          child: _buildVisibilityIteme(),
        ),
      ),
    );
  }
}
