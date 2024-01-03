import 'package:weather_app/features/weather/domain/entities/coordinates.dart';

class CoordinatesModel extends CoordinatesEntity {
  const CoordinatesModel({
    required super.longtitude,
    required super.lattitude,
  });

  factory CoordinatesModel.fromJson(Map<String, dynamic> json) {
    return CoordinatesModel(
      longtitude: json['lon'],
      lattitude: json['lat'],
    );
  }
}
