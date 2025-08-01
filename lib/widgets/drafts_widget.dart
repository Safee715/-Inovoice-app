import 'package:flutter/material.dart';

class DraftsWidget extends StatefulWidget {
  const DraftsWidget({super.key});

  @override
  State<DraftsWidget> createState() => _DraftsWidgetState();
}

class _DraftsWidgetState extends State<DraftsWidget> {
  @override
  Widget build(BuildContext context) {
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
                    padding:EdgeInsets.only(right: 10,left: 10),
                    minimumSize: Size(50, 19),
                    backgroundColor: Color(0xffD6DAE0),
                  ),
                  child: Text('No Status',
                    style: TextStyle(fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),

            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Receipt Id'),
              Text('Issue Date',
                style: TextStyle(color: Colors.grey),),
              Text('Due Date',
                style: TextStyle(color: Colors.grey),),
            ],
          ),
          Divider(color: Colors.grey[50],),
          Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text('Total:'),
                  Text('Paid:'),
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
                      style: TextStyle(color: Colors.black),),
                    Text('PKR 00.00',
                      style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,
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
