import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sy_travel_animation/utils/PageScrollHolder.dart';
import 'package:sy_travel_animation/utils/constantes.dart';
import 'dart:math' as math;

class LeopardPageDescWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var decalageFin = -screenWidth;
    const decalageDebut = 30.0;

    return Consumer<PageScrollHolder>(
      builder: (_, holder, child) {
        var page = holder.currentPage;
        return Positioned(
          top: descTopGap(context),
          left: (decalageFin - decalageDebut) * 2 * page + decalageDebut,
          child: Opacity(
            opacity: math.max(0, (1 - (10 * page))),
            child: Container(
              width: screenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Travel Description',
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: screenWidth - (2 * decalageDebut),
                    child: Text(
                        'The leopard is distinguished by its well-camouflaged fur, opportunistic hunting behaviour, broad diet, and strength.',
                      style: TextStyle(
                        color: lightGrey,
                        height: 1.7
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
