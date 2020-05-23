import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sy_travel_animation/utils/PageScrollHolder.dart';
import 'package:sy_travel_animation/utils/constantes.dart';
import 'dart:math' as math;

class PageIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     double size = 8;

    return Consumer<PageScrollHolder>(
      builder: (_, holder, child) {

        var page = holder.currentPage.round();
        var firstPage = page == 0;
        var color1 = firstPage ? white : Colors.transparent;
        var color2 = !firstPage ? white : Colors.transparent;
        return Positioned(
          bottom: 30,
          left: (MediaQuery.of(context).size.width/2) - (3/2 * size),
          child: Row(
            children: <Widget>[
              Round(size: size, color: color1,),
              SizedBox(width: size,),
              Round(size: size, color: color2)
            ],
          ),
        );
      },
    );
  }
}

class Round extends StatelessWidget {

  final double size;
  final Color color;

  Round({this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: white, width: 1.0)
      ),
    );
  }
}
