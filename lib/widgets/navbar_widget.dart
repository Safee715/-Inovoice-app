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
            child: ClipRRect(borderRadius: BorderRadiusGeometry.circular(10.0),
              child: NavigationBar(shadowColor: Colors.white,
                destinations: [
                  NavigationDestination(
                      icon: Icon(Icons.home,
                      color:selected_page==0?Colors.blue:Colors.grey,),
                      label: 'Home'),
                  NavigationDestination(
                      icon: Icon(Icons.people,
                        color:selected_page==1?Colors.blue:Colors.grey,),
                      label: 'Clients'),
                  NavigationDestination(
                      icon: Icon(Icons.add_circle,
                        color:Colors.blue,size:60.0,shadows: [
                          Shadow(blurRadius: 20.0,color: Colors.white,offset: Offset(0, 0))],
                      ),
                    label: "",
                      ),
                  NavigationDestination(
                      icon: Icon(Icons.shopping_cart,
                        color:selected_page==3?Colors.blue:Colors.grey,),
                      label: 'Items'),
                  NavigationDestination(
                      icon: Icon(Icons.person,
                        color:selected_page==4?Colors.blue:Colors.grey,),
                      label: 'Profile'),
              
                ],backgroundColor: Colors.white,
                onDestinationSelected:(int value) {
                  selected_page_notifier.value=value;
              
                } ,
                selectedIndex: selected_page,indicatorColor: Colors.transparent,
              ),
            ),
          );
        },
    );
  }
}
