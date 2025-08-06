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
    final screen_Width=MediaQuery.of(context).size.width;
    final screen_Height=MediaQuery.of(context).size.height;
    return Container(constraints: BoxConstraints(
        minWidth: screen_Width*0.381,
        minHeight:screen_Height*0.250),
      padding: EdgeInsets.all(screen_Width*0.024),
      width: screen_Width*0.381,
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

          SizedBox(height:screen_Height*0.011,),
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
    final screen_Width=MediaQuery.of(context).size.width;
    final screen_Height=MediaQuery.of(context).size.height;
    return Container(constraints: BoxConstraints(
        minWidth: screen_Width*0.381,
        minHeight:screen_Height*0.250),
      padding: EdgeInsets.all(screen_Width*0.024),
      width: screen_Width*0.381,
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
          SizedBox(height:screen_Height*0.011,),
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








