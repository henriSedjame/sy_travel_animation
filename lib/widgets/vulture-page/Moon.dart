import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sy_travel_animation/utils/PageScrollHolder.dart';
import 'package:sy_travel_animation/utils/constantes.dart';
import 'dart:math' as math;

import 'package:sy_travel_animation/widgets/common/page_indicator.dart';

class Moon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;

    return Consumer<PageScrollHolder>(builder: (_, holder, child) {
      var page = holder.currentPage ?? 0.0;
      var opacity = math.max(0.0, (20.0*page - 19.0));
      return Positioned(
        top: 250 + ((1 - opacity) * screenWidth/2),
        left: 0,
        right: 0,
        child: Opacity(
          opacity: opacity,
          child: Center(
            child: Round(
              size: screenWidth/2 * opacity,
              color: lightGrey,
              border: false,
            ),
          ),
        ));
    });
  }
}
