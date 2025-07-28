import 'package:flutter/material.dart';
import 'package:invoiceapp/data/notifiers.dart';
import 'package:invoiceapp/pages/Items_page.dart';
import 'package:invoiceapp/pages/add_clients_page.dart';
import 'package:invoiceapp/pages/clients_page.dart';
import 'package:invoiceapp/pages/home_page.dart';
import 'package:invoiceapp/pages/profile_page.dart';

List<Widget> navbarwidgets=[HomePage(),ClientsPage(),AddClientsPage(),ItemsPage(),ProfilePage()];
class NavBarWidget2 extends StatefulWidget {
  const NavBarWidget2({super.key});

  @override
  State<NavBarWidget2> createState() => _NavBarWidget2State();
}

class _NavBarWidget2State extends State<NavBarWidget2> {
  @override
  Widget build(BuildContext context) {
    return Container(

        child: ValueListenableBuilder(
            valueListenable: selected_page_notifier,
            builder: (context, selected_page, child) {
            return Container(height: 60,
              decoration: BoxDecoration(color: Colors.white,borderRadius:BorderRadius.circular(20.0,) ,),
              padding: EdgeInsets.all(10),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(onPressed: (){
                        selected_page_notifier.value=0;
                      },
                        icon: Icon(Icons.home,
                                    color:selected_page==0?Colors.blue:Colors.grey,
                      ),
                      ),
                      Text('Home')
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(onPressed: (){
                        selected_page_notifier.value=1;
                      },
                        icon: Icon(Icons.people,
                          color:selected_page==1?Colors.blue:Colors.grey,
                        ),
                      ),
                      Text('Clients')
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(onPressed: (){
                        selected_page_notifier.value=2;
                         AddClientsPage();
                      },
                        icon: Icon(Icons.add_circle,size: 60,
                          color:selected_page==2?Colors.blue:Colors.blue,
                        ),
                      ),
                      Text('')
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(onPressed: (){
                        selected_page_notifier.value=3;
                      },
                        icon: Icon(Icons.add_shopping_cart_rounded,
                          color:selected_page==3?Colors.blue:Colors.grey,
                        ),
                      ),
                      Text('Items')
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(onPressed: (){
                        selected_page_notifier.value=4;
                      },
                        icon: Icon(Icons.person,
                          color:selected_page==4?Colors.blue:Colors.grey,
                        ),
                      ),
                      Text('Profile')
                    ],
                  ),


                ],

              ),
            );
            },
        ),
    );
  }
}
