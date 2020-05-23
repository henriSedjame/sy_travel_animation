import 'package:flutter/material.dart';
import 'package:sy_travel_animation/widgets/7_2_widget.dart';
import 'package:sy_travel_animation/widgets/leopard_page_desc_widget.dart';

class LeopardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        b72Widget(),
        LeopardPageDescWidget(),
      ],
    );
  }
}
