import 'package:flutter/material.dart';

class MockScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('I am also Mock'),
      ),
      body: Center(
        child: OutlineButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Back'),
        ),
      ),
    );
  }
}
