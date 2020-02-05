import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trex/core/app_router.dart';

import 'mock_screen2.dart';

class MockScreen extends StatelessWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute<Widget>(
      builder: (_) => MockScreen(),
    );
  }

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
                AppRouter.pop(context);
              },
              child: const Text('Back'),
            ),
            OutlineButton(
              onPressed: () {
                AppRouter.push(context, MockScreen.route());
              },
              child: const Text('go deeper'),
            ),
            OutlineButton(
              onPressed: () {
                AppRouter.push(context, MockScreen2.route());
              },
              child: const Text('go to end'),
            ),
          ],
        ),
      ),
    );
  }
}
