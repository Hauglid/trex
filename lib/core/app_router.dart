import 'package:flutter/material.dart';

mixin AppRouter {
  static Future<T> push<T extends Object>(
    BuildContext context,
    Route<dynamic> route,
  ) {
    return Navigator.of(context).push(route);
  }

  static bool pop<T extends Object>(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      return Navigator.of(context).pop();
    } else
      return false;
  }

  static void popUntil<T extends Object>(
    BuildContext context,
    Route<dynamic> route,
  ) {
    return Navigator.of(context)
        .popUntil((Route<dynamic> route) => route.isFirst);
  }
}
