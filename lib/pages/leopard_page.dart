import 'package:flutter/material.dart';
import 'package:sy_travel_animation/widgets/leopard-page/7_2_widget.dart';
import 'package:sy_travel_animation/widgets/leopard-page/leopard_page_desc_widget.dart';

class LeopardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        B72Widget(),
        LeopardPageDescWidget(),
      ],
    );
  }
}
