import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sy_travel_animation/utils/PageScrollHolder.dart';
import 'package:sy_travel_animation/utils/constantes.dart';
import 'dart:math' as math;

import 'package:sy_travel_animation/widgets/common/page_indicator.dart';

class Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;

    return Consumer3<PageScrollHolder, Animation, AnimationController>(
        builder: (_, holder, animation, mapCtrl,child) {
      var page = holder.currentPage ?? 0.0;
      var animVal = animation.value;
      var speed =
          math.max(0, 1 - 200 * animVal) * math.max(0.0, (100.0 * page - 99.0));
      var opacity = math.max(0.0, (20.0 * page - 19.0));
      var contentHeight = animVal *
          (screenHeight -
              ((screenHeight - descTopGap(context)) + b72TopGap(context)));

      var mapValue = mapCtrl.value;
      return Positioned(
          bottom: screenHeight - (descTopGap(context) + 75) - 8,
          left: 0,
          right: 0,
          child: Opacity(
            opacity: opacity,
            child: Container(
              height: contentHeight + 16,
              width: double.infinity,
              child: Stack(
                overflow: Overflow.visible,
                alignment: Alignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        right: speed * 45.0 + (0.8 * mapValue * screenWidth/3),
                        top: contentHeight),
                    child: Round(
                      size: 8,
                      color: mainBlack,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: speed * 15.0,),
                    child: Opacity(
                      opacity: speed,
                      child: Round(
                        size: 5,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: speed * 15.0,),
                    child: Opacity(
                      opacity: speed,
                      child: Round(
                        size: 5,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: speed * 45.0 + (0.3 * mapValue * screenWidth/4),
                        bottom: (1 - speed) * contentHeight,
                        top: speed * contentHeight),
                    child: Round(
                      size: 8,
                      color: white,
                    ),
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
