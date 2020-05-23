import 'package:flutter/material.dart';
import 'package:sy_travel_animation/utils/constantes.dart';

class MenuIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      child: Column(
        children: <Widget>[
          Container(
            width: 18,
            height: 2,
            color: white,
          ),
          SizedBox(height: 4,),
          Container(
            width: 18,
            height: 2,
            color: white,
          )
        ],
      ),
    );
  }
}
