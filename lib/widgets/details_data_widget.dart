import 'package:flutter/material.dart';


class DetailsDataWidget extends StatefulWidget {
  const DetailsDataWidget({super.key});

  @override
  State<DetailsDataWidget> createState() => _DetailsDataWidgetState();
}

class _DetailsDataWidgetState extends State<DetailsDataWidget> {
  @override
  Widget build(BuildContext context) {
    return
      Flexible(
        child: GridView.extent(
maxCrossAxisExtent: 157,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.5,
          padding: EdgeInsetsGeometry.directional(),
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.teal[50],
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Total Amounts',
                      style: TextStyle(
                        fontSize: 12,
                       fontFamily:'Biennale',fontWeight: FontWeight.w500,
                      ),
                    ),
                    leading: Icon(
                      Icons.attach_money_outlined,
                      color: Colors.teal[600],),
                  ),
                  Text(
                    '4328PKR',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,fontSize: 20,),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.blue[50],
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Total Paid',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color:Colors.blue[600],
                      ),
                    ),
                    leading: Icon(
                      Icons.money,
                      color: Colors.blue[600],),
                  ),
                  Text(
                    '4328PKR',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,fontSize: 20,),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.red[50],
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Total Due',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[600],
                      ),
                    ),
                    leading: Icon(
                      Icons.account_balance_wallet_outlined,
                      color: Colors.red[600],),
                  ),
                  Text(
                    '4328PKR',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,fontSize: 20,),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.purple[50],
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Total Clients',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple[600],
                      ),
                    ),
                    leading: Icon(Icons.people,
                      color: Colors.purple[600],),
                  ),
                  Text(
                    '15',
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20,),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.blue[50],
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Total Items',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[600],
                      ),
                    ),
                    leading: Icon(
                      Icons.add_shopping_cart,
                      color: Colors.blue[600],),
                  ),
                  Text(
                    '10',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,fontSize: 20,),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.green[50],
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Total Invoices',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[600],
                      ),
                    ),
                    leading: Icon(Icons.receipt_long_rounded,
                      color: Colors.green[600],),
                  ),
                  Text(
                    '50',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,fontSize: 20,),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.orange[100],
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Paid Invoices',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[600],),
                    ),
                    leading: Icon(Icons.receipt,
                      color:Colors.orange[600],),
                  ),
                  Text(
                    '24',
                    style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black,fontSize: 20,),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.red[50],
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Due Invoices',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[600],
                      ),
                    ),
                    leading: Icon(Icons.receipt_long,
                      color: Colors.red[600],),
                  ),
                  Text(
                    '52',
                    style: TextStyle(fontWeight: FontWeight.bold,
                      color: Colors.black,fontSize: 20,),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  }
}
