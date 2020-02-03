import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:trex/features/bmi/BMICalculator.dart';
import './bloc.dart';

class BmiBloc extends Bloc<BmiEvent, BmiResultState> {
  @override
  Stream<BmiResultState> mapEventToState(
    BmiEvent event,
  ) async* {
    if (event is UpdateBmiEvent) {
      final BMICalculator bmiCalculator =
          BMICalculator(weight: event.weight, height: event.height);
      final String bmi = bmiCalculator.calculateBMI();

      yield BmiResultState(
          bmi: bmi, weight: event.weight, height: event.height);
    }
  }

  @override
  BmiResultState get initialState =>
      BmiResultState(bmi: '0', height: 100, weight: 40);
}
