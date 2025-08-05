import 'package:flutter/material.dart';

class DraftsWidget extends StatefulWidget {
  const DraftsWidget({super.key});

  @override
  State<DraftsWidget> createState() => _DraftsWidgetState();
}

class _DraftsWidgetState extends State<DraftsWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Peter Paul',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0
                ),
              ),
               ElevatedButton(onPressed: (){} ,
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 1,color: Color(0xffC8CBD1),

                    ),shadowColor: Colors.transparent,
                    padding:EdgeInsets.only(right: 10,left: 10),
                    minimumSize: Size(50, 19),
                    backgroundColor: Color(0xffD6DAE0),
                  ),
                  child: Text('No Status',
                    style: TextStyle(fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff303744)),
                  ),
                ),

            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('IN-01'),

              Text('Issue: 00-00-2024',
                style: TextStyle(fontSize: 12,color: Color(0xffBEC0CC),),),
              Container(width: 1,height: 20,
                color: Color(0xff000000).withValues(alpha: 0.1),),
              Text('Due: 00-00-2024',
                style: TextStyle(fontSize: 12,color: Color(0xffBEC0CC),),),
            ],
          ),
          Divider(color: Color(0xff000000).withValues(alpha: 0.1),thickness: 1,),
          Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text('Total: ',style: TextStyle(fontSize: 12,color: Color(0xff303744),),),
                  Text('Paid: ',style: TextStyle(fontSize: 12,color: Color(0xff303744),),),
                ],
              ),
              Column(
                children: [
                  Text('PKR 34579',
                      style: TextStyle(
                          color: Color(0xff3AC4FF),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  Text('PKR 00.00',
                      style: TextStyle(
                          color: Color(0xffFFAE00),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                ],
              ),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Due Amount',
                      style: TextStyle(color: Color(0xff303744),),),
                    Text('PKR 00.00',
                      style: TextStyle(color: Color(0xffF26666),fontWeight: FontWeight.bold,
                          fontSize: 17.0
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
