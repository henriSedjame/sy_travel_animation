import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sy_travel_animation/pages/leopard_page.dart';
import 'package:sy_travel_animation/pages/vulture_page.dart';
import 'package:sy_travel_animation/utils/PageScrollHolder.dart';
import 'package:sy_travel_animation/widgets/common/app_bar_widget.dart';
import 'package:sy_travel_animation/widgets/common/arrow_icon.dart';
import 'package:sy_travel_animation/widgets/common/on_map_btn.dart';
import 'package:sy_travel_animation/widgets/common/page_indicator.dart';
import 'package:sy_travel_animation/widgets/common/share_btn_widget.dart';
import 'package:sy_travel_animation/widgets/leopard-page/leopard_widget.dart';
import 'package:sy_travel_animation/widgets/vulture-page/base_camp_label.dart';
import 'package:sy_travel_animation/widgets/vulture-page/dots.dart';
import 'package:sy_travel_animation/widgets/vulture-page/vulture_page_desc_widget.dart';
import 'package:sy_travel_animation/widgets/vulture-page/vulture_widget.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {

  PageController _pageController;
  PageScrollHolder _pageScrollHolder;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    _pageController = PageController();
    _pageScrollHolder = PageScrollHolder(_pageController);
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
        value: _pageScrollHolder,
        child: Stack(
          children: <Widget>[

            AppBarWidget(),
            PageIndicator(),
            ShareBtnWidget(),
            ArrowIcon(),
            OnMapBtn(
              onPressed: (){},
            ),
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
            Dots()

          ],
        ),
      ),
    );
  }
}
