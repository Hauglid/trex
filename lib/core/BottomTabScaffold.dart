import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trex/core/AppTheme.dart';
import 'package:trex/features/HomeScreen.dart';
import 'package:trex/features/ProfileScreen.dart';
import 'package:trex/features/bmi/bloc/BMIScreenBloc.dart';
import 'package:trex/features/bmi/bloc/bloc/bloc.dart';
import 'package:trex/features/bmi/setState/BMIScreenSetState.dart';

class BottomTabScaffold extends StatelessWidget {
  final List<BottomNavigationBarItem> tabItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Home'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.fitness_center),
      title: Text('BMI Bloc'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.fitness_center),
      title: Text('BMI Set State'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text('Profile'),
    ),
  ];

  final List<Widget> screens = <Widget>[
    HomeScreen(),
    BlocProvider<BmiBloc>(
      create: (context) => BmiBloc(),
      child: BMIScreenBloc(),
    ),
    BMIScreenSetState(),
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
        assert(index >= 0 && index <= 2);
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
