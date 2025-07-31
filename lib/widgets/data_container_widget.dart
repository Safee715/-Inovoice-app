import 'package:flutter/material.dart';
import 'package:invoiceapp/widgets/custom_icon_widget.dart';

class DataContainerWidget extends StatefulWidget {
  const DataContainerWidget({super.key,
  required this.icon,
    required this.text,
    required this.amount,
    required this.color1,
    required this.color2
  });
  final String icon;
  final String text;
  final String amount;
  final Color color1;
  final Color color2;

  @override
  State<DataContainerWidget> createState() => _DataContainerWidgetState();
}

class _DataContainerWidgetState extends State<DataContainerWidget> {
  @override
  Widget build(BuildContext context) {
final screen_Width=MediaQuery.of(context).size.width;
final screen_Height=MediaQuery.of(context).size.height;

    return Container(constraints: BoxConstraints(minWidth: screen_Width*0.381,minHeight:screen_Height*0.067),
      padding: EdgeInsets.all(10),
      width: screen_Width*0.4,
      decoration: BoxDecoration(color: widget.color1,borderRadius:BorderRadius.circular(10),),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CustomIconWidget(
                iconaddress:widget.icon,
                height: 24, weight: 24,
                color: widget.color2,
              ),
              SizedBox(width: 10,),
              SizedBox(
                child: Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily:'Biennale',fontWeight: FontWeight.w500,
                    color: widget.color2,
                  ),
                ),
              ),
            ],
          ),
          FittedBox(fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              widget.amount,
              style: TextStyle(fontFamily: 'Biennale',
                fontWeight: FontWeight.bold,
                color: Colors.black,fontSize:16,),
            ),
          ),
        ],
      ),
    );
  }
}
