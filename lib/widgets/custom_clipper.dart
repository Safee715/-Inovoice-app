
import 'package:flutter/cupertino.dart';

class ArcBottomCustomClipper extends CustomClipper<Path>
{ ArcBottomCustomClipper ({required this.radius,this.curveDepth});
  final double radius;
  final double? curveDepth;
  @override
  Path getClip(Size size)
  {
    double width=size.width;
    double height=size.height;
    Path path=Path();
path.lineTo(0, height-radius*0.75);
path.quadraticBezierTo(width/2, height+radius*0.72,width,height-radius*0.65);
path.lineTo(width, 0);
path.close();


    return path;
  }

  @override
bool shouldReclip(covariant CustomClipper<Path> oldClipper)=>true;
}