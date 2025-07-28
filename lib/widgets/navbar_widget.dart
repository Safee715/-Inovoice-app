import 'package:flutter/material.dart';
import 'package:invoiceapp/data/notifiers.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({super.key});

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: selected_page_notifier,
        builder:(context,selected_page, child)
        {
          return SafeArea(
            child: ClipRRect(borderRadius: BorderRadius.circular(10.0),
              child: NavigationBar(shadowColor: Colors.white,
                destinations: [
                  NavigationDestination(selectedIcon:Icon(Icons.home,color: Colors.blue,
              ) ,
                      icon: Icon(Icons.home,
                      ),
                      label: 'Home'),
                  NavigationDestination(selectedIcon: Icon(Icons.people,
                      color:Colors.blue),
                      icon: Icon(Icons.people,
                        ),
                      label: 'Clients'),
                  NavigationDestination(selectedIcon: Icon(Icons.add_circle,
                    color:Colors.blue,size:60.0,shadows: [
                      Shadow(blurRadius: 20.0,color: Colors.white,offset: Offset(0, 0))],
                  ),
                      icon: Icon(Icons.add_circle,
                        color:Colors.blue,size:60.0,shadows: [
                          Shadow(blurRadius: 20.0,color: Colors.white,offset: Offset(0, 0))],
                      ),
                    label: "",
                      ),
                  NavigationDestination(selectedIcon:Icon(Icons.shopping_cart,
                    color:Colors.blue) ,
                      icon: Icon(Icons.shopping_cart,
                        ),
                      label: 'Items'),
                  NavigationDestination(selectedIcon: Icon(Icons.person,
                    color:Colors.blue,),
                      icon: Icon(Icons.person,
                        ),
                      label: 'Profile'),
              
                ],backgroundColor: Colors.white,
                onDestinationSelected:(int value) {
                  selected_page_notifier.value=value;
              
                } ,
                selectedIndex: selected_page,
                indicatorColor: Colors.transparent,
              ),
            ),
          );
        },
    );
  }
}
