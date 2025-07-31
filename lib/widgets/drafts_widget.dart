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
                    fontSize: 24.0
                ),
              ),
              Container(
                decoration: BoxDecoration(color:Colors.red[100] ,
                  borderRadius: BorderRadius.circular(25),
                  border:Border.all(color: Colors.red) ),
                child: TextButton(onPressed: (){} ,
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                    
                  ),
                  child: Text('No Status',style: TextStyle(fontSize: 12,color: Colors.red),
                  ),
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
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  Text('PKR 00.00',
                      style: TextStyle(
                          color: Colors.yellow[700],
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
