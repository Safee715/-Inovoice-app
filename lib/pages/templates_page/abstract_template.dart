import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:flutter/material.dart';



abstract class AbstractTemplate extends StatelessWidget {
  const AbstractTemplate({super.key,
  required this.id,
    required this.name,
    required this.amount,
    required this.boxcolor,
    required this.textcolor,

  });

  final  String id;
  final String name;
  final String amount;
  final Color boxcolor;
  final Color textcolor;


}

class RectangularTemplate extends AbstractTemplate {
  const RectangularTemplate({super.key,
  required super.id,
  required super.name,
  required super.amount,
required super.boxcolor,
required super.textcolor,

  });




  @override
  Widget build(BuildContext context) {
    HomePageViewmodel homePageViewmodel=HomePageViewmodel();
    return Container(constraints: BoxConstraints(
        minWidth: homePageViewmodel.getWidth(context, 157),
        minHeight:homePageViewmodel.getHeight(context, 261)),
      padding: EdgeInsets.all(homePageViewmodel.getWidth(context, 10)),
      width: homePageViewmodel.getWidth(context, 157),
      decoration: BoxDecoration(color: boxcolor,
        borderRadius:BorderRadius.circular(10),),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
             Text(id),
              SizedBox(width: 10,),
              SizedBox(
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily:'Biennale',fontWeight: FontWeight.w500,
                    color: textcolor,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height:homePageViewmodel.getHeight(context, 12),),
          Align(alignment: Alignment.center,
            child: Text(
              amount,
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

class DesignedTemplate extends AbstractTemplate {
  const DesignedTemplate({super.key,
    required super.id,
    required super.name,
    required super.amount,
    required super.boxcolor,
    required super.textcolor,
  });

  @override
  Widget build(BuildContext context) {
    HomePageViewmodel homePageViewmodel=HomePageViewmodel();
    return Container(constraints: BoxConstraints(
        minWidth: homePageViewmodel.getWidth(context, 157),
        minHeight:homePageViewmodel.getHeight(context, 261),
    ),
      padding: EdgeInsets.all(homePageViewmodel.getWidth(context, 10),),
      width: homePageViewmodel.getWidth(context, 157),
      decoration: BoxDecoration(color: boxcolor,
        borderRadius:BorderRadius.circular(10),),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFF3AC4FF)),
            child: Row(
              children: [
                Text(id),
                SizedBox(width: 10,),
                SizedBox(
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily:'Biennale',fontWeight: FontWeight.w500,
                      color: textcolor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height:homePageViewmodel.getWidth(context, 12),),
          Align(alignment: Alignment.center,
            child: Text(
              amount,
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








