import 'package:flutter/material.dart';
import 'package:sy_travel_animation/widgets/vulture-page/Moon.dart';
import 'package:sy_travel_animation/widgets/vulture-page/km_label.dart';
import 'package:sy_travel_animation/widgets/vulture-page/start_camp_label.dart';

class VulturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Moon(),
        StartCampLabel(),
        KmLabel(),
      ],
    );
  }
}
