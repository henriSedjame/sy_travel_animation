
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sy_travel_animation/utils/animation_icon_holder.dart';
import 'package:sy_travel_animation/utils/constantes.dart';

class ArrowIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<Animation, AnimationIconHolder>(
      builder: (_, animation, iconHolder, child) {
        var animVal = animation.value;
        return Positioned(
          top: (1-animVal) * (descTopGap(context) - b72TopGap(context)) + b72TopGap(context),
          right: 30,
          child: SizedBox(
            width: 25,
            height: 25,
            child: FlareActor('assets/flare/Arrow-up-down.flr',
              animation: iconHolder.arrowAnimationName,
            ),
          ),
        );
      },

    );
  }
}
