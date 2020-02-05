import 'package:flutter/material.dart';
import 'package:trex/core/app_router.dart';

class MockScreen2 extends StatelessWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute<Widget>(
      builder: (_) => MockScreen2(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('I am also Mock'),
      ),
      body: Center(
        child: OutlineButton(
          onPressed: () {
            AppRouter.pop(context);
          },
          child: const Text('Back'),
        ),
      ),
    );
  }
}
