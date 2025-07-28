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
                fontSize: 24.0
            ),
          ),
            TextButton(onPressed: (){} ,
              style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.red[100]),),
              child: Text('Status',style: TextStyle(color: Colors.red),),),
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
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                  fontSize: 17.0)),
                  Text('PKR 00.00',
                      style: TextStyle(
                          color: Colors.yellow[700],
                          fontWeight: FontWeight.bold,
                      fontSize: 17.0)),
                ],
              ),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Due Amount',
                      style: TextStyle(color: Colors.black),),
                    Text('PKR 425.23',
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
