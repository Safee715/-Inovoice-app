import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/widgets/custom_icon_widget.dart';

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
    HomePageViewmodel homePageViewmodel=HomePageViewmodel(
        screenWidth:MediaQuery.of(context).size.width ,
      screenHeight: MediaQuery.of(context).size.height

    );
    bool isDark =Theme.of(context).brightness==Brightness.dark;


    return Container(constraints: BoxConstraints(
        minWidth: homePageViewmodel.getWidth(154),
        minHeight:homePageViewmodel.getHeight( 70),),
      padding: EdgeInsets.all(homePageViewmodel.getWidth( 10),),
      width: homePageViewmodel.getWidth( 157),
      decoration: BoxDecoration(color: widget.color1,
        borderRadius:BorderRadius.circular(10),),
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
          SizedBox(height:homePageViewmodel.getHeight( 5),),
          Text(
            widget.amount,
            style: TextStyle(fontFamily: 'Biennale',
              fontWeight: FontWeight.bold,
              color: homePageViewmodel.getTextColor(isDark),fontSize:16,),
          ),
        ],
      ),
    );
  }
}
