import 'package:flutter/material.dart';
import 'package:sy_travel_animation/widgets/menu_icon.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('SY', style: TextStyle(
              fontSize: 16,
              fontWeight:  FontWeight.bold
            ),),
            MenuIcon()
          ],
        ),
      ),
    );
  }
}
