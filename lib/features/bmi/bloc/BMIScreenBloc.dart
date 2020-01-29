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

    Widget heightWidget = Expanded(
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
                  builder: (context, state) {
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
                inactiveTrackColor: Color(0xFF8D8E98),
                activeTrackColor: Colors.white,
                thumbColor: Color(0xFFEB1555),
                overlayColor: Color(0x29EB1555),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
              ),
              child: BlocBuilder<BmiBloc, BmiResultState>(
                builder: (context, state) {
                  return Slider(
                    value: state.height,
                    min: 100,
                    max: 220.0,
                    onChanged: (newValue) {
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

    Widget weightWidget = Expanded(
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
                        builder: (context, state) {
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
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: BlocBuilder<BmiBloc, BmiResultState>(
                      builder: (context, state) {
                        return Slider(
                          value: state.weight,
                          min: 40,
                          max: 300.0,
                          onChanged: (newValue) {
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

    Widget bmiWidget = BlocBuilder<BmiBloc, BmiResultState>(
      builder: (context, state) {
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
        title: Text('BMI CALCULATOR Bloc'),
      ),
      body: Container(
        padding: EdgeInsets.all(4),
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
