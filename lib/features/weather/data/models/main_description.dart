import 'package:weather_app/features/weather/domain/entities/main_description.dart';

class MainDescriptionModel extends MainDescriptionEntity {
  const MainDescriptionModel({
    required super.temp,
    required super.feelsLike,
    required super.tempMin,
    required super.tempMax,
    required super.pressure,
    required super.humidity,
    required super.seaLevel,
    required super.grndLevel,
  });

  factory MainDescriptionModel.fromJson(Map<String, dynamic> json) {
    return MainDescriptionModel(
      temp: json['temp'],
      feelsLike: json['feels_like'],
      tempMax: json['temp_max'],
      tempMin: json['temp_min'],
      pressure: json['pressure'],
      humidity: json['humidity'],
      seaLevel: json['sea_level'],
      grndLevel: json['grnd_level'],
    );
  }
}
