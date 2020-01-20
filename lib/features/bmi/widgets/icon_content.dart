import 'package:flutter/material.dart';
import 'package:trex/features/bmi/constants.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label, this.color});

  final IconData icon;
  final String label;
  final color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: color,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
