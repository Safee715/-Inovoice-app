import 'package:DummyInvoice/widgets/bar_chart/bar_chart_viewmodel.dart';
import 'package:flutter/material.dart';


class BarChart extends CustomPainter{
  BarChartViewmodel barChartViewmodel=BarChartViewmodel();
  @override

  void paint(Canvas canvas,Size size)
  {

     barChartViewmodel.drawBars(
        canvas, size.height,
 size.width
    );

     barChartViewmodel.drawLabels(canvas, size.height, size.width);

  }
  @override
  bool shouldRepaint(covariant BarChart oldDelegate)=>true;
}
