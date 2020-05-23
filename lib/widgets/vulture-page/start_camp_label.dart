import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sy_travel_animation/utils/PageScrollHolder.dart';
import 'package:sy_travel_animation/utils/constantes.dart';
import 'dart:math' as math;

class StartCampLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    var decalageFin = screenWidth;
    const decalageDebut = 30.0;
    return Consumer<PageScrollHolder>(builder: (_, holder, child) {
      var page = holder.currentPage ?? 0.0;
      return Positioned(
        top: descTopGap(context) + 70,
        left : (-decalageFin + decalageDebut) * 2 * (1- page) + decalageDebut,
        child: Opacity(
          opacity: math.max(0, (10*page - 9)),
          child: SizedBox(
            width: (screenWidth - 2*decalageDebut)/2,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text('Start camp',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13
                  ),),
                  SizedBox(height: 30,),
                  Text('02:40  pm',
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
