import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trex/core/AppRouter.dart';

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
      body: Container(
        padding: EdgeInsets.all(8),
        child: Center(
            child: Card(
          child: Container(
            padding: EdgeInsets.all(16),
            child: OutlineButton(
              onPressed: () {
                AppRouter.push(context, Routes.mock);
              },
              child: Text('Go to mock screen'),
            ),
          ),
        )),
      ),
    );
  }
}
