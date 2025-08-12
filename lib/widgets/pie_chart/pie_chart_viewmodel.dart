import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class PieChartViewmodel {
 Map<String, Map<String,double>> dataMap=
 {
   'This Week':
   {
     'Paid': 1508048.00,
     'Due': 505876.00,
     'Cash':624640.00
   },
   'Last Week':
   {
     'Paid': 18048.00,
     'Due': 55876.00
   }
 };
final chartRadius=276.59;

  final  colorsList=<List<Color>>[
  [
    Color(0xffFFAE00),
    Color(0xffFFCD63),

  ],
    [
      Color(0xffFE9696),
      Color(0xffF26666),
    ],
    [
      Color(0xffFe9656),
      Color(0xffF27739),
    ],

  ];

final NumberFormat currencyFormat=NumberFormat('#,##0.00','en_US');


}