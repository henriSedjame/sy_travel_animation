import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sy_travel_animation/pages/leopard_page.dart';
import 'package:sy_travel_animation/pages/vulture_page.dart';
import 'package:sy_travel_animation/utils/PageScrollHolder.dart';
import 'package:sy_travel_animation/utils/animation_icon_holder.dart';
import 'package:sy_travel_animation/utils/constantes.dart';
import 'package:sy_travel_animation/widgets/common/app_bar_widget.dart';
import 'package:sy_travel_animation/widgets/common/arrow_icon.dart';
import 'package:sy_travel_animation/widgets/common/on_map_btn.dart';
import 'package:sy_travel_animation/widgets/common/page_indicator.dart';
import 'package:sy_travel_animation/widgets/common/share_btn_widget.dart';
import 'package:sy_travel_animation/widgets/leopard-page/leopard_widget.dart';
import 'package:sy_travel_animation/widgets/vulture-page/base_camp_label.dart';
import 'package:sy_travel_animation/widgets/vulture-page/dots.dart';
import 'package:sy_travel_animation/widgets/vulture-page/map_widget.dart';
import 'package:sy_travel_animation/widgets/vulture-page/travel_lines.dart';
import 'package:sy_travel_animation/widgets/vulture-page/vulture_page_desc_widget.dart';
import 'package:sy_travel_animation/widgets/vulture-page/vulture_widget.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with TickerProviderStateMixin {

  PageController _pageController;
  PageScrollHolder _pageScrollHolder;
  AnimationIconHolder _animationIconHolder;
  AnimationController _animationController;
  AnimationController _mapAnimationController;
  Animation _animation;
  bool _showMap = false;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 900))
     ..addListener(() { setState(() {});});

    _mapAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 900));

    _animation = CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn);

    _pageController = PageController();
    _pageScrollHolder = PageScrollHolder(_pageController);
    _animationIconHolder = AnimationIconHolder();

    _pageController.addListener(() {
      if(_pageController.page > 0){
        if(_animationController.isCompleted) {
          _animationController.reverseDuration = Duration(milliseconds: 1);
          _animationController.reverse();
          _animationIconHolder.animArrow(ArrowAnims.DOWN_TO_UP);
        }

      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _pageScrollHolder),
        ChangeNotifierProvider.value(value: _animationIconHolder),
        ListenableProvider.value(value: _animation),
        ListenableProvider.value(value: _mapAnimationController),
      ],
      child: Scaffold(
        body: GestureDetector(
          onVerticalDragUpdate: _handleDragUpdate,
          onVerticalDragEnd:  _handleDragEnd,
          child: Stack(
            children: <Widget>[
              PageView(
                controller: _pageController,
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  LeopardPage(),
                  VulturePage()
                ],
              ),
              LeopardWidget(),
              VultureWidget(),
              VulturePageDescWidget(),
              BaseCampLabel(),
              ArrowIcon(),
              if(_showMap)MapWidget(),
              AppBarWidget(),
              PageIndicator(),
              ShareBtnWidget(),
              OnMapBtn(
                onPressed: () {
                  setState(() {
                    _showMap = !_showMap;
                    if(_mapAnimationController.isCompleted) {
                      _mapAnimationController.reverse();
                      _animationIconHolder.animMenu(MenuAnims.BACK_TO_MENU);
                    } else if(_mapAnimationController.isDismissed) {
                      _mapAnimationController.forward();
                      _animationIconHolder.animMenu(MenuAnims.MENU_TO_BACK);
                    }

                  });
                },
              ),
              TravelLines(),
              Dots(),
            ],
          ),
        ),

      ),
    );
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    if(_pageController.page == 1 && !_showMap){
      _animationController.value -= details.primaryDelta / MediaQuery.of(context).size.height;
    }
  }

  void _handleDragEnd(DragEndDetails details) {
    if(_pageController.page == 1 && !_showMap) {
      if (_animationController.isAnimating ||
          _animationController.status == AnimationStatus.completed) return;

      final double flingVelocity =
          details.velocity.pixelsPerSecond.dy / MediaQuery.of(context).size.height;

      /* if(velocity > 0) _animationController  => complete */
      /* if(velocity < 0) _animationController  => dismissed */
      if (flingVelocity < 0.0){
        _animationController.fling(velocity: math.max(2.0, -flingVelocity));
        _animationIconHolder.animArrow(ArrowAnims.UP_TO_DOWN);
      } else if (flingVelocity > 0.0) {
        _animationController.fling(velocity: math.min(-2.0, -flingVelocity));
        _animationIconHolder.animArrow(ArrowAnims.DOWN_TO_UP);
      } else
        _animationController.fling(
            velocity: _animationController.value < 0.5 ? -2.0 : 2.0);
    }
  }
}
