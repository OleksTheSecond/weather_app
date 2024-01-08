import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/weather/data/models/coordinates.dart';
import 'package:weather_app/features/weather/domain/repository/coordinates_repo.dart';

class CoordinatesRepositoryImpl extends CoordinatesRepository {
  @override
  Future<DataState<CoordinatesModel>> getLocation() async {
    LocationPermission permision = await Geolocator.checkPermission();

    if (permision == LocationPermission.denied) {
      permision = await Geolocator.requestPermission();
    }

    if (permision == LocationPermission.always ||
        permision == LocationPermission.whileInUse) {
      final locationEnabled = await Geolocator.isLocationServiceEnabled();
      if (!locationEnabled) {
        return DataLocationException(
            LoactionException("Enable location service"));
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      return DataSuccess(CoordinatesModel(
          longitude: position.longitude, latitude: position.latitude));
    }

    return DataLocationException(LoactionException("Allow location"));
  }
}
