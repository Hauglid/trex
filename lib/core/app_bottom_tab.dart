import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trex/core/app_theme.dart';
import 'package:trex/features/exercise_screen.dart';
import 'package:trex/features/home_screen.dart';
import 'package:trex/features/profile_screen.dart';

class MyTabItem {
  MyTabItem({this.barItem, this.screen});
  BottomNavigationBarItem barItem;
  Widget screen;
}

class AppBottomTab extends StatelessWidget {
  final List<MyTabItem> tabItems = <MyTabItem>[
    MyTabItem(
      barItem: BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: const Text('Home'),
      ),
      screen: HomeScreen(),
    ),
    MyTabItem(
      barItem: BottomNavigationBarItem(
        icon: Icon(Icons.fitness_center),
        title: const Text('Exercise'),
      ),
      screen: ExerciseScreen(),
    ),
    MyTabItem(
        barItem: BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center),
          title: const Text('BMI et State'),
        ),
        screen: ExerciseScreen()),
    MyTabItem(
      barItem: BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: const Text('Profile'),
      ),
      screen: ProfileScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: AppTheme.shared.canvasColor,
        activeColor: AppTheme.shared.accentColor,
        items: tabItems.map((MyTabItem tabItem) => tabItem.barItem).toList(),
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return tabItems[index].screen;
          },
        );
      },
    );
  }
}
