
import 'package:flutter/material.dart';
import 'package:sy_travel_animation/utils/constantes.dart';

class RoutePainter extends CustomPainter {

  final Paint painter;
  AnimationController controller;


  RoutePainter({this.controller}): painter = Paint() {
    painter.color = white;
    painter.style = PaintingStyle.stroke;
    painter.strokeWidth = 2.0;

  }

  @override
  void paint(Canvas canvas, Size size) {

    var width = size.width;
    var height = size.height;
    var value = controller.value;
    canvas.save();
    canvas.translate(width/2 , 0);

    drawLine(canvas, width, height, value);

    canvas.restore();

  }

  void drawLine(Canvas canvas, double width, double height, double value) {
    var path = Path();

    var pX0 = 15*value;
    var pY0 = 0.0;

    var pX1 =  0.85 * value * width/6;
    var pY1 = height / 3 - (40 * value);

    var pX2 = 0.80 * value * width/6;
    var pY2 = 2 * height / 3 + (10 * value);

    var pX3 = -0.8 * value * width/6;
    var pY3 =height;

    path.moveTo(pX0, pY0);

    path.lineTo(pX1, pY1);

    path.lineTo(pX2, pY2);

    path.lineTo(pX3, pY3);

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(RoutePainter oldDelegate) => controller.value != oldDelegate.controller.value;

}
