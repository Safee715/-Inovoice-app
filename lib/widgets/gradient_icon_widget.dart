import 'package:flutter/material.dart';

class GradientIconWidget extends StatefulWidget {
  const GradientIconWidget({super.key,
    required this.icon,
    required this.size,
    required this.gradient,

  });

  final IconData icon;
  final double size;
  final Gradient gradient;

  @override
  State<GradientIconWidget> createState() => _GradientIconWidgetState();
}

class _GradientIconWidgetState extends State<GradientIconWidget> {
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (bounds) =>
            widget.gradient.createShader(
              Rect.fromLTWH(0, 0, widget.size, widget.size),
            ),
      child: Icon(widget.icon,size: widget.size,color: Colors.white,),
        );
  }
}
