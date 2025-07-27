import 'package:flutter/material.dart';
import 'package:invoiceapp/widgets/navbar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(backgroundColor: Colors.grey[400],
  title: Text('Invoice Maker',
    style: TextStyle(fontWeight: FontWeight.bold),
  ),
  leading:IconButton(onPressed: (){}, icon:Icon(Icons.menu_outlined)),
actions: [IconButton(onPressed: (){}, icon: Icon(Icons.notifications))],
),
      body: SingleChildScrollView(
        child: Padding(
        padding:EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(padding: EdgeInsets.all(20.0),
              height: 376.0,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),),
              child:GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.5,
                children: [
                  Container(
                  decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(20.0),
                      color: Colors.teal[50]),
                    child: Column(
                      children: [
                        ListTile(title: Text('Total Amounts',style: TextStyle(fontSize: 6),),
                          leading: Icon(Icons.attach_money_outlined),
                        ),
                        Text('4328PKR',style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(20.0),
                        color: Colors.blue[50],
                    ),
                    child: Column(
                      children: [
                        ListTile(title: Text('Total Amounts',style: TextStyle(fontSize: 6),),
                          leading: Icon(Icons.attach_money_outlined),
                        ),
                        Text('4328PKR',style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(20.0),
                        color: Colors.red[50],
                    ),
                    child: Column(
                      children: [
                        ListTile(title: Text('Total Amounts',style: TextStyle(fontSize: 6),),
                          leading: Icon(Icons.attach_money_outlined),
                        ),
                        Text('4328PKR',style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(20.0),
                        color: Colors.purple[50]),
                    child: Column(
                      children: [
                        ListTile(title: Text('Total Amounts',style: TextStyle(fontSize: 6),),
                          leading: Icon(Icons.attach_money_outlined),
                        ),
                        Text('4328PKR',style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(20.0),
                        color: Colors.blue[50]),
                    child: Column(
                      children: [
                        ListTile(title: Text('Total Amounts',style: TextStyle(fontSize: 6),),
                          leading: Icon(Icons.attach_money_outlined),
                        ),
                        Text('4328PKR',style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(20.0),
                        color: Colors.green[50]),
                    child: Column(
                      children: [
                        ListTile(title: Text('Total Amounts',style: TextStyle(fontSize: 6),),
                          leading: Icon(Icons.attach_money_outlined),
                        ),
                        Text('4328PKR',style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(20.0),
                        color: Colors.orange[100]),
                    child: Column(
                      children: [
                        ListTile(title: Text('Total Amounts',style: TextStyle(fontSize: 6),),
                          leading: Icon(Icons.attach_money_outlined),
                        ),
                        Text('4328PKR',style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(20.0),
                        color: Colors.red[50]),
                    child: Column(
                      children: [
                        ListTile(title: Text('Total Amounts',style: TextStyle(fontSize: 9 ),),
                          leading: Icon(Icons.attach_money_outlined),
                        ),
                        Text('4328PKR',style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),

                  ),
                  

                ],
              ),
              ),
              ListTile(
                title: Text('Recent Invoices',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24.0),),),
              Container(
                height: 163.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.all(Radius.circular(30),
                  ),
                ),
              ),
              ListTile(title: Text('Recent Invoices',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24.0),),),

              Container(

                height: 163.0,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.teal,
                  borderRadius: BorderRadius.all(Radius.circular(30)
                  ),
                ),
              ),
              
            ],
          ),
        
        ),
      ),




      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: NavbarWidget(),
      ),


      );


  }
}
