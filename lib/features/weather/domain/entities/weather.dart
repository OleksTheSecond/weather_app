import "package:equatable/equatable.dart";

class WeatherEntity extends Equatable {
  const WeatherEntity({
    required this.id,
    required this.main,
    required this.shortDescription,
    required this.icon,
  });
  final int id;
  final String main;
  final String shortDescription;
  final String icon;

  @override
  List<Object?> get props => [id, main, shortDescription, icon];
}
