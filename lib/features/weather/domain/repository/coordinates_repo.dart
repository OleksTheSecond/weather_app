import 'package:weather_app/features/weather/domain/entities/coordinates.dart';

abstract class CoordinatesRepository {
  Future<CoordinatesEntity?> getLocation();
}
