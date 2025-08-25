import 'package:flutter/material.dart';

class DrawBars extends CustomPainter {
  @override
  DrawBars(
    this.homePageViewmodel,
    this.selected_key,
    this.data,
  );
  final homePageViewmodel;
  final selected_key;
  final data;

  void paint(Canvas canvas, Size size) {
    homePageViewmodel.drawLabels1(
      data,
      canvas,
      size.height,
      size.width,
    );
    homePageViewmodel.horizontalGrid(
      canvas,
      size.width,
      size.height,
    );
    homePageViewmodel.verticalGrid(
      canvas,
      size.width,
      size.height,
    );
    homePageViewmodel.drawBars(
      data,
      canvas,
      size.height,
      homePageViewmodel.getWidth(285.0),
    );
    homePageViewmodel.drawPolyLine(
      data,
      canvas,
      size.height,
      homePageViewmodel.getWidth(285.0),
    );

    homePageViewmodel.drawLabels2(
      data,
      canvas,
      size.height,
      size.width,
    );
    homePageViewmodel.drawXLabels(
      data,
      canvas,
      homePageViewmodel.getWidth(298.0),
      size.height,
    );
  }

  @override
  bool shouldRepaint(
    covariant DrawBars oldDelegate,
  ) {
    return oldDelegate.selected_key !=
        selected_key;
  }
}
