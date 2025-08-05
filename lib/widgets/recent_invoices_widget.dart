import 'package:flutter/material.dart';

class RecentInvoicesWidget extends StatefulWidget {
  const RecentInvoicesWidget({super.key});

  @override
  State<RecentInvoicesWidget> createState() => _RecentInvoicesWidgetState();
}

class _RecentInvoicesWidgetState extends State<RecentInvoicesWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text('Jhon James',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0
            ),
          ),
             ElevatedButton(onPressed: (){} ,
                style:ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  minimumSize: Size(50, 19),shadowColor: Colors.transparent,
                side: BorderSide(
                    color: Color(0xffF26666),width: 1),
                  backgroundColor: Color(0xffF26666).withValues(alpha: 0.2),),
                child: Text('Unpaid',
                  style: TextStyle(color: Colors.red,fontWeight: FontWeight.w400,fontSize: 12),),
              ),

      ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('IN-01'),
              Text('Issue: 05-15-2024',
                style: TextStyle(fontSize: 12,color: Color(0xffBEC0CC),),
              ),
              Container(width: 1,height: 20,
                color: Color(0xff000000).withValues(alpha: 0.1),),
              Text('Due: 13-12-2024',
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
                    Text('PKR 457.45',
                      style: TextStyle(
                          color: Color(0xffF26666),
                          fontWeight: FontWeight.bold,
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
