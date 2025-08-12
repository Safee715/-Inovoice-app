import 'package:flutter/material.dart';


class GridLines extends CustomPainter{

  @override
  GridLines(this.barChartViewmodel);
  final barChartViewmodel;
  void paint(Canvas canvas,Size size)
  {
    barChartViewmodel.drawGridLines(canvas, size.height, size.width);




  }
  @override
  bool shouldRepaint(covariant GridLines oldDelegate)=>true;
}
