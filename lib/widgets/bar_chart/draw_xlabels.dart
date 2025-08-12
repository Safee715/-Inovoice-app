import 'package:flutter/material.dart';

class DrawXlabels extends CustomPainter{
  @override
  DrawXlabels({required this.barChartViewmodel});
  final barChartViewmodel;
 void paint(Canvas canvas,Size size)
  {
    barChartViewmodel.drawXLabels(canvas,size.width);
  }
  @override
  bool shouldRepaint(covariant DrawXlabels oldDelegate)=>true;



}