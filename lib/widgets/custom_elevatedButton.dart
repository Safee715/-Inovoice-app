import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton
    extends StatefulWidget {
  const CustomElevatedButton({
    super.key,
    required this.function,
    this.buttonColor,
    required this.textColor,
    this.borderColor,
    this.text,
   required this.gradient,
  });

  final Function()? function;
  final Color? buttonColor;
  final Color textColor;
  final Color ?borderColor;
  final String ?text;
  final bool gradient;

  @override
  State<CustomElevatedButton> createState() =>
      _CustomElevatedButtonState();
}

class _CustomElevatedButtonState
    extends State<CustomElevatedButton> {
  Constants constants = Constants();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(187),
      height: 50,
      decoration: BoxDecoration(border: Border.all(color: widget.borderColor??Colors.transparent),
        borderRadius: BorderRadius.circular(10.0),
        gradient: widget.gradient?constants.gradient
            :LinearGradient(
            colors: [
              Colors.transparent,
              Colors.transparent]
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: widget.function,

        child: Text(
          widget.text??'',
          style: TextStyle(
            color: widget.textColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
