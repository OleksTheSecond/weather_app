import 'package:weather_app/features/weather/domain/entities/coordinates.dart';

class CoordinatesModel extends CoordinatesEntity {
  const CoordinatesModel({
    required super.longitude,
    required super.latitude,
  });

  factory CoordinatesModel.fromJson(Map<String, dynamic> json) {
    return CoordinatesModel(
      longitude: json['lon'],
      latitude: json['lat'],
    );
  }
}
