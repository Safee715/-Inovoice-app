import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:flutter/material.dart';


class DrawBars extends CustomPainter{

  @override
  DrawBars(this.barChartViewmodel,this.selected_key,this.data);
  final barChartViewmodel;
  final selected_key;
  final data;



  HomePageViewmodel homePageViewmodel=HomePageViewmodel();

  void paint(Canvas canvas,Size size)
  {
    barChartViewmodel.drawLabels1(data,canvas,size.height, size.width);
    barChartViewmodel.horizontalGrid(canvas,size.width,size.height,);
    barChartViewmodel.verticalGrid(canvas,size.width,size.height,);
    barChartViewmodel.drawBars(data,canvas,size.height,barChartViewmodel.getWidth(285.0),);
    barChartViewmodel.drawPolyLine(data,canvas,size.height,barChartViewmodel.getWidth(285.0));

    barChartViewmodel.drawLabels2(data,canvas,size.height,size.width);
    barChartViewmodel.drawXLabels(data,canvas,barChartViewmodel.getWidth(298.0),size.height);
  }
  @override
  bool shouldRepaint(covariant DrawBars oldDelegate)
  {
    return oldDelegate.selected_key !=selected_key;
  }
}
