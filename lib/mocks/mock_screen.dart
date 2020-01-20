import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mock_screen2.dart';

class MockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is Mock'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            OutlineButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Back'),
            ),
            OutlineButton(
              onPressed: () {
                Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) => MockScreen()));
              },
              child: Text('go deeper'),
            ),
            OutlineButton(
              onPressed: () {
                Navigator.of(context).push(
                    CupertinoPageRoute(builder: (context) => MockScreen2()));
              },
              child: Text('go to end'),
            ),
          ],
        ),
      ),
    );
  }
}
