import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sy_travel_animation/utils/PageScrollHolder.dart';
import 'package:sy_travel_animation/utils/constantes.dart';

class VultureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    var topGap = (screenHeight - vultureTransformedHeight) / 2;
    var rightGap = (screenWidth - vultureTransformedWidth) / 2;

    /*
    * Pour le déplacement du vautour
    * on suit l'équation de droite suivante y = (a(x) + b) + g
    * où y est la position du vautour et x la position de la page et g le décalage
    */
    var gap = vultureDecalage * screenWidth;

    return Consumer2<PageScrollHolder, AnimationController>(
      builder: (ctx, holder, animation, child) {
        var page = holder.currentPage ?? 0.0;
        var animVal = animation.value;
        return Positioned(
            top: topGap,
            height: vultureTransformedHeight,
            right: ((2 * rightGap + gap) * page) - (rightGap + gap),
            child: Transform.scale(
              alignment: Alignment(-0.7, 0),
                scale: 1 - 0.1 * animVal,
                child: Opacity(
                  opacity: 1 - 0.6 * animVal,
                    child: child)));
      },
      child: IgnorePointer(
        child: Image(
          image: AssetImage(vultureAsset),
        ),
      ),
    );
  }
}
