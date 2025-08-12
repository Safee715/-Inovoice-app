import 'package:flutter/material.dart';


class DrawBars extends CustomPainter{

  @override
  DrawBars(this.barChartViewmodel);
  final barChartViewmodel;
  void paint(Canvas canvas,Size size)
  {

    barChartViewmodel.drawBars(
        canvas, size.height,
        size.width
    );


  }
  @override
  bool shouldRepaint(covariant DrawBars oldDelegate)=>true;
}
