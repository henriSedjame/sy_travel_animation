import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sy_travel_animation/utils/animation_icon_holder.dart';

class MenuIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AnimationIconHolder>(
      builder: (_, holder, child) {

        return SizedBox(
          width: 30,
          height: 15,
          child: FlareActor(
            'assets/flare/Menu-Back.flr',
            animation: holder.menuAnimationName,
          ));
      },
    );
  }
}
