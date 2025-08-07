import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:DummyInvoice/data/notifiers.dart';
import 'package:DummyInvoice/widgets/custom_icon_widget.dart';

class CustomCuppertinoButton extends StatefulWidget {
  const CustomCuppertinoButton({super.key,
  required this.iconAddress,
    required this.onPressed,
    required this.index,

  });
  final String iconAddress;
  final VoidCallback onPressed;
final int index;
  @override
  State<CustomCuppertinoButton> createState() => _CustomCuppertinoButtonState();
}

class _CustomCuppertinoButtonState extends State<CustomCuppertinoButton> {
  @override
  Widget build(BuildContext context) {
    return
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              widget.onPressed();
            },
            minimumSize: Size(20, 20),
            child: CustomIconWidget(
              iconaddress:
                widget.iconAddress,
              height: 20,
              weight: 18,
              color: selected_widget_notifier.value == widget.index
                  ? Colors.blue
                  : Colors.grey,
            ),
          );


  }
}
