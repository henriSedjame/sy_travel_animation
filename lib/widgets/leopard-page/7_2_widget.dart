import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sy_travel_animation/utils/PageScrollHolder.dart';
import 'package:sy_travel_animation/utils/constantes.dart';

class B72Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;

    var decalageFin = -screenWidth;
    const decalageDebut = -60.0;

    return Consumer<PageScrollHolder>(
      builder: (_, holder, child) {
        var page = holder.currentPage ?? 0.0;

        return Positioned(
          top: b72TopGap(context),
          left: (decalageFin - decalageDebut) * 2 * page + decalageDebut,
          child: IgnorePointer(
            child: Container(
              height: b72Height(context),
              child: FittedBox(
                child: RotatedBox(
                    quarterTurns: 1,
                    child: Text(
                      '72',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
            ),
          ),
        );
      },
    );
  }
}
