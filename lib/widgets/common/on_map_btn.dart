import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sy_travel_animation/utils/PageScrollHolder.dart';
import 'dart:math' as math;

class OnMapBtn extends StatelessWidget {

  VoidCallback onPressed;

  OnMapBtn({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Consumer<PageScrollHolder>(
      builder: (_, holder, child) {
        var page = holder.currentPage ?? 0.0;
        return Positioned(
          bottom: 10,
          left: 30,
          child: Opacity(
            opacity: math.max(0, (100*page - 99)),
            child: FlatButton(
              child: Text('ON MAP', style: TextStyle(
                  fontSize: 13
              ),),
              onPressed: onPressed,
            ),
          ),
        );
      },
    );
  }
}
