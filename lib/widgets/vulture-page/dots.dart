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

    return Consumer<PageScrollHolder>(builder: (_, holder, child) {
      var page = holder.currentPage ?? 0.0;
      var opacity = math.max(0.0, (100.0*page - 99.0));
      var opacity2 = math.max(0.0, (20.0*page - 19.0));
      return Positioned(
        top: descTopGap(context) + 75,
        left: 0,
        right: 0,
        child: Opacity(
          opacity: opacity2,
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: opacity * 45.0),
                  child: Round(size: 6, color: Colors.transparent,),
                ),
                Padding(
                  padding: EdgeInsets.only(right: opacity * 15.0),
                  child: Round(size: 3, color: Colors.grey,),
                ),
                Padding(
                  padding: EdgeInsets.only(left: opacity * 15.0),
                  child: Round(size: 3, color: Colors.grey,),
                ),
                Padding(
                  padding: EdgeInsets.only(left: opacity * 45.0),
                  child: Round(size: 6, color: white,),
                ),
              ],
            ),
          ),
        ));
    });
  }
}
