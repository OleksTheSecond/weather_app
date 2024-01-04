import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/weather/domain/entities/coordinates.dart';

abstract class CoordinatesRepository {
  Future<DataState<CoordinatesEntity>> getLocation();
}
