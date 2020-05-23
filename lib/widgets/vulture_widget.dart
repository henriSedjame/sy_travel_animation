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
    var rightGap = (screenWidth - vultureTransformedWidth)/ 2;

    var gap = 60.0;

    return Consumer<PageScrollHolder>(
      builder: (ctx, holder, child) {
        var page = holder.currentPage;

        return Positioned(
            top: topGap,
            height: vultureTransformedHeight,
            right: ((2 * rightGap + gap) * page) - (rightGap + gap),
            child: child);
      },
      child: IgnorePointer(
        child: Image(
          image: AssetImage(vultureAsset),
        ),
      ),
    );
  }
}
