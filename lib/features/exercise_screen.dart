import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trex/core/app_theme.dart';

class ExerciseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Exercise Tab',
          ),
        ),
        body: ListView(
          children: <Widget>[
            NrkTekniskFeil(),
            NrkTekniskFeil(),
            NrkTekniskFeil(),
            NrkTekniskFeil(),
            NrkTekniskFeil(),
          ],
        ));
  }
}

class NrkTekniskFeil extends StatelessWidget {
  final String viBeklager = 'VI BEKLAGER';
  final String tekniskFeil = ' TEKNISK FEIL';
  final TextStyle textStyle = TextStyle(
    fontSize: 24,
    foreground: Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5
      ..color = AppTheme.shared.textTheme.title.color,
  );

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.2,
      child: Container(
        padding: const EdgeInsets.only(top: 70, bottom: 70),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                viBeklager,
                style: textStyle,
              ),
              Stack(
                children: List<Widget>.generate(
                  5,
                  (int index) => Transform.rotate(
                    angle: index * 0.65,
                    child: Container(
                      child: Text(
                        tekniskFeil,
                        style: textStyle,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
