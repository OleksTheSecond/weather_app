import 'package:flutter/material.dart';
import 'package:weather_app/config/theme/color_scheme.dart';

abstract class AppTheme {
  static const EdgeInsets paddingsInCard = EdgeInsets.all(8.0);
  static const EdgeInsets paddingsAroundCard = EdgeInsets.all(8.0);

  static final ThemeData lightTheme =
      ThemeData(colorScheme: lightColorScheme, fontFamily: "Poppins");
  static final ThemeData darkTheme =
      ThemeData(colorScheme: darkColorScheme, fontFamily: "Poppins");
}
