import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconWidget extends StatefulWidget {
  const CustomIconWidget({super.key,
  required this.iconaddress,
    required this.height,
    required this.weight,
     this.color
  });
final String iconaddress;
final double height;
  final double weight;
  final Color? color;


  @override
  State<CustomIconWidget> createState() => _CustomIconWidgetState();
}

class _CustomIconWidgetState extends State<CustomIconWidget> {
  @override
  Widget build(BuildContext context) {
    return  SvgPicture.asset(widget.iconaddress,
      height: widget.height,width: widget.weight,
    colorFilter:widget.color!=null?
    ColorFilter.mode(widget.color!,BlendMode.srcIn ):null);
  }
}


