import "package:equatable/equatable.dart";

class WeatherEntity extends Equatable {
  const WeatherEntity({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  @override
  List<Object?> get props => [id, main, description, icon];
}
