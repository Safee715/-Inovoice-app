import 'package:flutter/material.dart';
import 'package:invoiceapp/data/notifiers.dart';

class ClientPageNavBar extends StatefulWidget {
  const ClientPageNavBar({super.key});

  @override
  State<ClientPageNavBar> createState() => _ClientPageNavBarState();
}

class _ClientPageNavBarState extends State<ClientPageNavBar> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: client_page_index,
      builder: (context, index, child) {
           return SafeArea(
          child: ClipRRect(borderRadius: BorderRadius.circular(10.0),
            child: NavigationBar(
              shadowColor: Colors.white,
              indicatorColor: Colors.transparent,
                destinations: [
                  NavigationDestination(
                      selectedIcon:Icon(Icons.receipt,color: Colors.blue,) ,
                      icon: Icon(Icons.receipt), label: 'Templates'),
                  NavigationDestination(
                      selectedIcon:Icon(Icons.people,color: Colors.blue,),
                      icon: Icon(Icons.people), label: 'Clients'),
                  NavigationDestination(
                      selectedIcon:Icon(Icons.shopping_cart,color: Colors.blue,),
                      icon: Icon(Icons.shopping_cart), label: 'Items'),
                ],
              onDestinationSelected: (int value) {
                client_page_index.value=value;
              },
              selectedIndex: index,


            ),
          ),
      );
      },
    );

  }
}
