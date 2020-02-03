import 'package:flutter/material.dart';
import 'package:trex/mocks/mock_screen.dart';
import 'package:trex/mocks/mock_screen2.dart';

mixin AppRouter {
  static const String initialRoute = Routes.homeScreen;
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// List of all non-anonymous routes in the app.
  ///
  /// I have to pass [RouteSettings] with a name in order for
  /// google analytics or similar services to pick up these events.
  static Route<dynamic> routes(RouteSettings settings) {
    switch (settings.name) {
      // Screen to boot the app.
      case Routes.mock:
        return MaterialPageRoute<Widget>(
            builder: (_) => MockScreen(), settings: settings);

      case Routes.mock2:
        return MaterialPageRoute<Widget>(
            builder: (_) => MockScreen2(), settings: settings);

      // 404 route in case invalid route is entered.
      default:
        return _build404(settings);
    }
  }

  static Future<T> push<T extends Object>(
    BuildContext context,
    String route,
  ) {
    return Navigator.of(context).push(
      routes(
        RouteSettings(name: route),
      ),
    );
  }

  /// Builds a generic 404 page with the route name.
  static MaterialPageRoute<Widget> _build404(RouteSettings settings) {
    return MaterialPageRoute<Widget>(builder: (_) {
      return Scaffold(
        body: Center(
          child: Text('No route defined for ${settings.name}'),
        ),
      );
    });
  }
}

/// List of available routes in the app.
class Routes {
  static const String mock = 'mock';
  static const String mock2 = 'mock2';

  static const String homeScreen = 'homeScreen';
  static const String exerciseScreen = 'exerciseScreen';
  static const String profileScreen = 'profileScreen';
}
