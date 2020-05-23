import 'package:flutter/material.dart';
import 'package:sy_travel_animation/utils/constantes.dart';

class ArrowIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: descTopGap(context),
      right: 30,
      child: Icon(Icons.keyboard_arrow_up),
    );
  }
}
