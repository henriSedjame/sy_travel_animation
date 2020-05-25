import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import 'package:sy_travel_animation/utils/constantes.dart';

class MapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AnimationController>(
      builder: (_, animation, child) {
        var animVal = animation.value;
        var scale = 1 - 0.3*(animVal - 1);
        var rotation = 0.05 *math.pi *(1 - animVal);
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..scale(scale, scale)
            ..rotateZ(rotation),
          child: Opacity(
            opacity: animVal,
            child: Container(
              height: double.infinity,
              color: mainBlack,
              child: Image(
                image: AssetImage('assets/images/map.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      },
    );
  }
}
