import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sy_travel_animation/utils/PageScrollHolder.dart';
import 'package:sy_travel_animation/utils/constantes.dart';

class LeopardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    var topGap=  (screenHeight - leopardImageHeight)/2;

    return Consumer2<PageScrollHolder, Animation>(
        builder: (_, holder, animation, child) {
          var page = holder.currentPage ?? 0.0;
          var animVal = animation.value;
          return Positioned(
              top: topGap,
              left: -screenWidth * leopardDecalage * page,

              width: screenWidth * (1/leopardRatio),
              child: Transform.scale(
                alignment: Alignment(0.5, 0),
                scale: -0.1*animVal + 1,
                  child: Opacity(
                    opacity: 1-0.6*animVal,
                      child: child)));
        },

        child: IgnorePointer(
          child: Image(
            image: AssetImage(leopardAsset),
          ),
        )
    );
  }
}
