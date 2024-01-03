import 'package:equatable/equatable.dart';

class CloudsEntity extends Equatable {
  const CloudsEntity({
    required this.percent,
  });
  final int percent;

  @override
  List<Object?> get props => [percent];
}
