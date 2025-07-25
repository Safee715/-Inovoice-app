import 'package:flutter/material.dart';
import 'package:invoiceapp/widgets/navbar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(backgroundColor: Color(0xFFF0F3F7),
  title: Text('Invoice Maker',
    style: TextStyle(fontWeight: FontWeight.bold),
  ),
  leading:IconButton(onPressed: (){}, icon:Icon(Icons.menu_outlined)),
actions: [IconButton(onPressed: (){}, icon: Icon(Icons.notifications))],
),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadiusGeometry.circular(10)),
            ),

            Container(
              decoration: BoxDecoration(color: Colors.teal,borderRadius: BorderRadiusGeometry.circular(10)),
            ),
            Positioned(bottom: 20.0,left: 20.0,right: 20.0,child: NavbarWidget())
          ],
        ),


      ),

    );
  }
}
