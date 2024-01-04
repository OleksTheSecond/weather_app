import 'package:geolocator/geolocator.dart';
import 'package:weather_app/features/weather/domain/entities/coordinates.dart';
import 'package:weather_app/features/weather/domain/repository/coordinates_repo.dart';

class CoordinatesRepositoryImpl extends CoordinatesRepository {
  @override
  Future<CoordinatesEntity?> getLocation() async {
    LocationPermission permision = await Geolocator.checkPermission();

    if (permision == LocationPermission.denied) {
      permision = await Geolocator.requestPermission();
    }

    if (permision == LocationPermission.always ||
        permision == LocationPermission.whileInUse) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return CoordinatesEntity(
          longitude: position.longitude, latitude: position.latitude);
    }

    return null;
  }
}
