import 'package:flutter/material.dart';
import 'package:trex/core/BottomTabScaffold.dart';

import 'core/AppTheme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BottomTabScaffold(),
      theme: AppTheme.shared,
    );
  }
}
