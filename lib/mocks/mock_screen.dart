import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mock_screen2.dart';

class MockScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('This is Mock'),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            OutlineButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Back'),
            ),
            OutlineButton(
              onPressed: () {
                Navigator.of(context).push<dynamic>(
                    CupertinoPageRoute<dynamic>(builder: (BuildContext context) => MockScreen()));
              },
              child: const Text('go deeper'),
            ),
            OutlineButton(
              onPressed: () {
                Navigator.of(context).push(
                    CupertinoPageRoute<dynamic>(builder: (BuildContext context) => MockScreen2()));
              },
              child: const Text('go to end'),
            ),
          ],
        ),
      ),
    );
  }
}
