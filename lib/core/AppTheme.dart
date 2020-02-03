import 'package:flutter/material.dart';

mixin AppTheme {
  static Color red = Colors.red;
  static Color green = Colors.green;
  static Color blue = Colors.blue;
  static Color yellow = Colors.yellow;
  static Color orange = Colors.orange;

  static Color black = Colors.black;
  static Color darkGrey = Colors.grey[900];

  static Color white = Colors.white;
  static TextTheme textTheme = ThemeData.dark().textTheme;
  
  static ThemeData shared = ThemeData.dark().copyWith(
    accentColor: orange,
    primaryTextTheme: textTheme.copyWith(title: TextStyle(color: orange))
  );

}
