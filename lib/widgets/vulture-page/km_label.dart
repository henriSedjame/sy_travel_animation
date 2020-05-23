import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sy_travel_animation/utils/PageScrollHolder.dart';
import 'package:sy_travel_animation/utils/constantes.dart';
import 'dart:math' as math;

class KmLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;

    return Consumer<PageScrollHolder>(builder: (_, holder, child) {
      var page = holder.currentPage ?? 0.0;
      return Positioned(
        top: descTopGap(context) + 112,
        child: Opacity(
          opacity: math.max(0, (100*page - 99)),
          child: SizedBox(
            width: screenWidth,
            child: Center(
              child: Text('72 Km',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),),
            ),
      ),
        ));
    });
  }
}
