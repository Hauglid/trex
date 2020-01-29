import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trex/core/AppRouter.dart';
import 'package:trex/features/bmi/widgets/reusable_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Tab',
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ReusableCard(
                child: Center(
                  child: FlatButton(
                    padding: EdgeInsets.all(24),
                    onPressed: () {
                      AppRouter.push(context, Routes.mock);
                    },
                    child: Text('Go to mock screen'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
