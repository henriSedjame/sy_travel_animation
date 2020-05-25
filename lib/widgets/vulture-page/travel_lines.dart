import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sy_travel_animation/utils/PageScrollHolder.dart';
import 'package:sy_travel_animation/utils/RoutePainter.dart';
import 'package:sy_travel_animation/utils/constantes.dart';
import 'package:sy_travel_animation/widgets/common/page_indicator.dart';

class TravelLines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;

    return Consumer3<PageScrollHolder, Animation, AnimationController>(
      builder: (_, holder, animation, mapCtrl, child) {

        var page = holder.currentPage ?? 0.0;
        var animVal = animation.value;
        var maxContentHeight = (screenHeight -
            ((screenHeight - descTopGap(context)) + b72TopGap(context)));
        var contentHeight = animVal * maxContentHeight;

        var firstLevel = contentHeight >= maxContentHeight / 3;
        var firstBisLevel = contentHeight >= maxContentHeight / 3 + 100;
        var secondLevel = contentHeight >= 2 * maxContentHeight / 3;

        var leopardsStartPosition = -100;
        var leopardsEndPosition = screenWidth/4 - 30;
        var vulturesStartPosition = -100;
        var vulturesEndPosition = screenWidth/4 - 30;
        var animalApparitionSpeed = (5 * animVal - 4);

        var a = (leopardsEndPosition - leopardsStartPosition) / 5;
        var b = leopardsEndPosition - a;

        var c = (vulturesEndPosition - vulturesStartPosition) / 5;
        var d = vulturesEndPosition - c;

        var mapAnimVal = mapCtrl.value;

        return Positioned(
          bottom: screenHeight - (descTopGap(context) + 75),
          child: Opacity(
            opacity: page == 1 ? 1 : 0,
            child: Container(
              width: screenWidth,
              height: contentHeight,
              child: Stack(
                overflow: Overflow.visible,
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    height: double.infinity,
                    width: screenWidth,

                    child: CustomPaint(
                      painter: RoutePainter(
                        controller: mapCtrl
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: maxContentHeight / 3 - (15 * mapAnimVal),
                    right: -0.8 * mapAnimVal * screenWidth/3,
                    left: 0,
                    child: Opacity(
                      opacity: firstLevel ? 1 : 0,
                      child: Round(
                        size: 8,
                        color: Colors.grey,
                        bordersize: 2,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 2 * maxContentHeight / 3 + (35 * mapAnimVal),
                    right: -0.55 * mapAnimVal * screenWidth/2,
                    left: 0,
                    child: Opacity(
                      opacity: secondLevel ? 1 : 0,
                      child: Round(
                        size: 8,
                        color: Colors.grey,
                        bordersize: 2,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 2 * maxContentHeight / 3,
                    left: a * animalApparitionSpeed + b,
                    child: Opacity(
                      opacity: secondLevel ? 1 : 0.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('assets/images/leopards.png'),
                                width: 35,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Leopards',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          if (animVal == 1 && mapAnimVal ==0)
                            Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 5, left: 40),
                                child: Container(
                                  color: white,
                                  height: 1,
                                  width: 20,
                                ))
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: maxContentHeight / 3,
                    right: c * animalApparitionSpeed + d,
                    child: Opacity(
                      opacity: firstBisLevel ? 1 : 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          if (animVal == 1 && mapAnimVal == 0)
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 5, right: 40),
                              child: Container(
                                color: white,
                                height: 1,
                                width: 20,
                              ),
                            ),
                          Column(
                            children: <Widget>[
                              Image(
                                image: AssetImage('assets/images/vultures.png'),
                                width: 30,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Vultures',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
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
