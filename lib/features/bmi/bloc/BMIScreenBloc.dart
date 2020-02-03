import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trex/features/bmi/bloc/bloc/bloc.dart';
import 'package:trex/features/bmi/constants.dart';
import 'package:trex/features/bmi/widgets/reusable_card.dart';

class BMIScreenBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //ignore: close_sinks
    final BmiBloc bmiBloc = BlocProvider.of<BmiBloc>(context);

    final Widget heightWidget = Expanded(
      child: ReusableCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'HEIGHT',
              style: kLabelTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                BlocBuilder<BmiBloc, BmiResultState>(
                  builder: (BuildContext context, BmiResultState state) {
                    return Text(
                      state.height.toStringAsFixed(0),
                      style: kNumberTextStyle,
                    );
                  },
                ),
                Text(
                  'cm',
                  style: kLabelTextStyle,
                ),
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                inactiveTrackColor: const Color(0xFF8D8E98),
                activeTrackColor: Colors.white,
                thumbColor: const Color(0xFFEB1555),
                overlayColor: const Color(0x29EB1555),
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
              ),
              child: BlocBuilder<BmiBloc, BmiResultState>(
                builder: (BuildContext context, BmiResultState state) {
                  return Slider(
                    value: state.height,
                    min: 100,
                    max: 220.0,
                    onChanged: (double newValue) {
                      bmiBloc.add(UpdateBmiEvent(
                          height: newValue, weight: state.weight));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );

    final Widget weightWidget = Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            child: ReusableCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'WEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      BlocBuilder<BmiBloc, BmiResultState>(
                        builder: (BuildContext context, BmiResultState state) {
                          return Text(
                            state.weight.toStringAsFixed(0),
                            style: kNumberTextStyle,
                          );
                        },
                      ),
                      Text(
                        'kg',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: BlocBuilder<BmiBloc, BmiResultState>(
                      builder: (BuildContext context, BmiResultState state) {
                        return Slider(
                          value: state.weight,
                          min: 40,
                          max: 300.0,
                          onChanged: (double newValue) {
                            bmiBloc.add(UpdateBmiEvent(
                                height: state.height, weight: newValue));
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    final Widget bmiWidget = BlocBuilder<BmiBloc, BmiResultState>(
      builder: (BuildContext context, BmiResultState state) {
        return Expanded(
          child: ReusableCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'YOUR BMI',
                  style: kLabelTextStyle,
                ),
                Text(
                  state.bmi,
                  style: kNumberTextStyle,
                ),
              ],
            ),
          ),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR Bloc'),
      ),
      body: Container(
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            heightWidget,
            weightWidget,
            bmiWidget,
          ],
        ),
      ),
    );
  }
}
