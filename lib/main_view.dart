import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sy_travel_animation/utils/PageScrollHolder.dart';
import 'package:sy_travel_animation/pages/leopard_page.dart';
import 'package:sy_travel_animation/pages/vulture_page.dart';
import 'package:sy_travel_animation/widgets/app_bar_widget.dart';
import 'package:sy_travel_animation/widgets/arrow_icon.dart';
import 'package:sy_travel_animation/widgets/leopard_page_desc_widget.dart';
import 'package:sy_travel_animation/widgets/leopard_widget.dart';
import 'package:sy_travel_animation/widgets/7_2_widget.dart';
import 'package:sy_travel_animation/widgets/page_indicator.dart';
import 'package:sy_travel_animation/widgets/share_btn_widget.dart';
import 'package:sy_travel_animation/widgets/vulture_widget.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {

  PageController _pageController;

  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    _pageController = PageController();

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
    return Scaffold(
      body: ChangeNotifierProvider.value(
        value: PageScrollHolder(_pageController),
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
            AppBarWidget(),
            PageIndicator(),
            ShareBtnWidget(),
            ArrowIcon()
          ],
        ),
      ),
    );
  }
}
