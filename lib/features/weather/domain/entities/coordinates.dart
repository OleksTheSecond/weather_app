import 'package:equatable/equatable.dart';

class CoordinatesEntity extends Equatable {
  final double longtitude;
  final double lattitude;

  const CoordinatesEntity({required this.longtitude, required this.lattitude});

  @override
  List<Object?> get props => [longtitude, lattitude];
}
