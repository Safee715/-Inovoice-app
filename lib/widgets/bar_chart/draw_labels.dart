import 'package:flutter/material.dart';


class DrawLabels extends CustomPainter{
  @override
DrawLabels(this.barChartViewmodel);
  final barChartViewmodel;
  void paint(Canvas canvas,Size size)
  {
    barChartViewmodel.drawLabels1(canvas, size.height, size.width);

  }
  @override
  bool shouldRepaint(covariant DrawLabels oldDelegate)=>true;
}
