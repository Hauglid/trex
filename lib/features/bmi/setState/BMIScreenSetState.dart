import 'package:flutter/material.dart';
import 'package:trex/features/bmi/BMICalculator.dart';
import 'package:trex/features/bmi/constants.dart';
import 'package:trex/features/bmi/widgets/reusable_card.dart';

enum Gender {
  male,
  female,
}

class BMIScreenSetState extends StatefulWidget {
  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreenSetState> {
  double height = 180;
  double weight = 60;
  int bmi = 0;

  @override
  Widget build(BuildContext context) {
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
                Text(
                  height.toString(),
                  style: kNumberTextStyle,
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
                thumbShape:
                    const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape:
                    const RoundSliderOverlayShape(overlayRadius: 30.0),
              ),
              child: Slider(
                value: height.toDouble(),
                min: 120.0,
                max: 220.0,
                onChanged: (double newValue) {
                  setState(() {
                    height = newValue.roundToDouble();
                  });
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
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
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
                    child: Slider(
                      value: weight.toDouble(),
                      min: 0.0,
                      max: 300.0,
                      onChanged: (double newValue) {
                        setState(() {
                          weight = newValue.roundToDouble();
                        });
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

    final Widget bmiWidget = Expanded(
      child: ReusableCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'YOUR BMI',
              style: kLabelTextStyle,
            ),
            Text(
              BMICalculator(height: height, weight: weight).calculateBMI(),
              style: kNumberTextStyle,
            ),
          ],
        ),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR SET STATE'),
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
        ));
  }
}
