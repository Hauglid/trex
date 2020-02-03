import 'dart:math';

import 'package:meta/meta.dart';

class BMICalculator {
  BMICalculator({@required this.height, @required this.weight});

  final double height;
  final double weight;

  double _bmi = 0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }
}
