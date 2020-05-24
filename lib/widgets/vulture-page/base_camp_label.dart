import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sy_travel_animation/utils/PageScrollHolder.dart';
import 'package:sy_travel_animation/utils/constantes.dart';
import 'dart:math' as math;

class BaseCampLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    var decalageFin = screenWidth;
    const decalageDebut = 30.0;
    return Consumer2<PageScrollHolder, AnimationController>(
        builder: (_, holder, animation, child) {
      var page = holder.currentPage ?? 0.0;
      var animVal = animation.value;
      return Positioned(
        top:(1-animVal)*(descTopGap(context)  - b72TopGap(context)) +  b72TopGap(context) + 70,
        right : (-decalageFin + decalageDebut) * 2 * (1- page) + decalageDebut,
        child: Opacity(
          opacity: math.max(0, (10*page - 9)),
          child: SizedBox(
            width: (screenWidth - 2*decalageDebut)/2,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Base camp',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13
                  ),),
                  SizedBox(height: 30,),
                  Text('07:30  am',
                    style: TextStyle(
                        color: lighterGrey,
                        fontSize: 12
                    ),),
                ],
              ),
            ),
      ),
        ));
    });
  }
}
