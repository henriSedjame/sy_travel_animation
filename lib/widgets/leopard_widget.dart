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

    return Consumer<PageScrollHolder>(
        builder: (BuildContext context, holder, Widget child) {
          var page = holder.currentPage;
          return Positioned(
              top: topGap,
              left: -screenWidth * leopardDecalage * page,
              //height: leopardImageHeight,
              width: screenWidth * (1/leopardRatio),
              child: child);
        },

        child: IgnorePointer(
          child: Image(
            image: AssetImage(leopardAsset),
          ),
        )
    );
  }
}
