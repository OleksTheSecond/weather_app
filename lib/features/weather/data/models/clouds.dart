import 'package:weather_app/features/weather/domain/entities/clouds.dart';

class CloudsModel extends CloudsEntity {
  const CloudsModel({
    required super.percent,
  });

  factory CloudsModel.fromJson(Map<String, dynamic> json) {
    return CloudsModel(percent: json['all']);
  }
}
