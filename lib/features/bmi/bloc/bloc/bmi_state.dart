import 'package:meta/meta.dart';

class BmiResultState {
  BmiResultState({
    @required this.bmi,
    @required this.weight,
    @required this.height,
  });

  final String bmi;
  final double weight;
  final double height;
}
