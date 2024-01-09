import 'package:flutter/material.dart';
import 'package:weather_app/config/theme/app_theme.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppTheme.paddingsAroundCard,
      child: Card(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: child,
      ),
    );
  }
}
