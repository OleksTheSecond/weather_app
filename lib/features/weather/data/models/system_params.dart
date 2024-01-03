import 'package:weather_app/features/weather/domain/entities/system_params.dart';

class SystemParamsModel extends SystemParamsEntity {
  const SystemParamsModel({
    required super.type,
    required super.id,
    required super.country,
    required super.sunrise,
    required super.sunset,
  });

  factory SystemParamsModel.fromJson(Map<String, dynamic> json) {
    return SystemParamsModel(
      type: json['type'],
      id: json['id'],
      country: json['country'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }
}
