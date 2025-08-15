import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PieChartViewmodel {

  PieChartViewmodel({this.screenWidth,this.screenHeight
  });
  final screenWidth;
  final screenHeight;

  Map<String, double> dataMap1 = {
    'Paid': 10508048.00,
    'Due': 5005876.00,
  };

  Map<String, double> dataMap2 = {'Paid': 10508048.00, 'Due': 505876.00};
  final chartRadius = 276.59;

  List<Color> colorsList = [Color(0xffFFBD2E), Color(0xffFE9696)];

  double getMaxValue(Map<String, double> dataMap) {
    double maxValue = dataMap.values.reduce((value, element) {
      return value > element ? value : element;
    });
    return maxValue;
  }
double getWidth(double figmaWidth)
{
  return (figmaWidth/412)*screenWidth;
}
  double getHeight(double figmaHeight)
  {
    return (figmaHeight/1046)*screenHeight;
  }
  final NumberFormat currencyFormat = NumberFormat('#,##0.00', 'en_US');
}
