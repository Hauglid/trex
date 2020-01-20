import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class BmiBloc extends Bloc<BmiEvent, BmiState> {
  @override
  BmiState get initialState => InitialBmiState();

  @override
  Stream<BmiState> mapEventToState(
    BmiEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
