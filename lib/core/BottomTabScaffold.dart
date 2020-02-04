import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trex/core/AppTheme.dart';
import 'package:trex/features/ExerciseScreen.dart';
import 'package:trex/features/HomeScreen.dart';

import '../features/ProfileScreen.dart';

class BottomTabScaffold extends StatelessWidget {
  final List<BottomNavigationBarItem> tabItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: const Text('Home'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.fitness_center),
      title: const  Text('BMI Bloc'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.fitness_center),
      title: const  Text('BMI Set State'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: const  Text('Profile'),
    ),
  ];

  final List<Widget> screens = <Widget>[
    HomeScreen(),
    ExerciseScreen(),
    ExerciseScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: AppTheme.shared.canvasColor,
        activeColor: AppTheme.shared.accentColor,
        items: tabItems,
      ),
      tabBuilder: (BuildContext context, int index) {
        // assert(index >= 0 && index <= 2);
        return CupertinoTabView(
          builder: (BuildContext context) {
            return screens[index];
          },
        );
        // screens[index];
      },
    );
  }
}
