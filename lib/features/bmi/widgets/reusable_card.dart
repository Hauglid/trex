import 'package:flutter/material.dart';
import 'package:trex/core/AppTheme.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.child, this.onPress});

  final Widget child;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    double blurRadius = 10;
    double spreadRadius = 1;
    double offset = 7;

    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: AppTheme.shared.canvasColor,
          borderRadius: BorderRadius.circular(24.0),
          boxShadow: [
            BoxShadow(
              color: Color(0x55000000),
              blurRadius: blurRadius, // has the effect of softening the shadow
              spreadRadius:
                  spreadRadius, // has the effect of extending the shadow
              offset: Offset(
                offset, // horizontal, move right 10
                offset, // vertical, move down 10
              ),
            ),
            BoxShadow(
              color: Color(0x28FFFFFF),
              blurRadius: blurRadius, 
              spreadRadius:
                  spreadRadius, 
              offset: Offset(
                -offset, 
                -offset, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
