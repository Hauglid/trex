import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BmiEvent extends Equatable {
}

class UpdateBmiEvent extends BmiEvent {
  UpdateBmiEvent({this.height, this.weight});

  final double weight;
  final double height;

  @override
  List<Object> get props => [height, weight];
}
