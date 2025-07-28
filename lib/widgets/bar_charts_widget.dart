import 'package:flutter/material.dart';

class BarChartsWidget extends StatefulWidget {
  const BarChartsWidget({super.key});

  @override
  State<BarChartsWidget> createState() => _BarChartsWidgetState();
}

class _BarChartsWidgetState extends State<BarChartsWidget> {
  @override
  Widget build(BuildContext context) {
    return Flexible(child: Text('Bar ChartsWidget'),);
  }
}
