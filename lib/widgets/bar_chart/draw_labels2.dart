import 'package:flutter/material.dart';



class DrawLabels2 extends CustomPainter{
  @override
  DrawLabels2(this.barChartViewmodel);
  final barChartViewmodel;
  void paint(Canvas canvas,Size size)
  {


    barChartViewmodel.drawLabels2(canvas, size.height, size.width);





  }

  @override
  bool shouldRepaint(covariant DrawLabels2 oldDelegate)=>true;
}
