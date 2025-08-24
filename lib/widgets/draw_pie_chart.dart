import 'package:flutter/material.dart';
import 'dart:math';

class DrawPieChart extends CustomPainter {
  DrawPieChart({
    required this.homePageViewmodel,
    required this.dataMap,
    required this.colorsList,
  });
  final homePageViewmodel;
  final Map dataMap;
  final List<Color> colorsList;

  @override
  void paint(Canvas canvas, Size size) {
    final radius = (size.width>size.height?size.height:size.width ) * 0.5;

    final center = Offset(size.width / 2, size.height / 2);
    double startingAngle = 0;
    final total = dataMap.values.cast<double>().reduce(
      (value, element) => value + element,
    );
    for (int i = 0; i < dataMap.length; i++) {
      double sweepAngle = pi * 2 * (dataMap.values.elementAt(i) / total);
      final paint = Paint()..color = colorsList[i];
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startingAngle,
        sweepAngle,
        true,
        paint,
      );
      final labelAngle = startingAngle + sweepAngle / 2;
      final labelRadius = radius * 0.6;
      final labelX = center.dx + (labelRadius) * cos(labelAngle);
      final labelY = center.dy + (labelRadius) * sin(labelAngle);

      final textPainter = TextPainter(
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,

        text: TextSpan(
          text: 'PKR : ${dataMap.values.elementAt(i).toString()}',
          style: TextStyle(
            color: Color(0xffFFFFFF),
            backgroundColor: Colors.transparent,
            fontFamily: 'Biennale',
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(
            labelX - textPainter.width / 2, labelY - textPainter.height / 2),
      );

      startingAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant DrawPieChart oldDelegate) => true;
}
