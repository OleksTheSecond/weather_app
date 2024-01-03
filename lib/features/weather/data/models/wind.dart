import 'package:weather_app/features/weather/domain/entities/wind.dart';

class WindModel extends WindEntity {
  const WindModel({
    required super.speed,
    required super.deg,
    required super.gust,
  });

  factory WindModel.fromJson(Map<String, dynamic> json) {
    return WindModel(
      speed: json['speed'],
      deg: json['deg'],
      gust: json['gust'],
    );
  }
}
