import 'package:flutter/material.dart';
import 'package:invoiceapp/data/notifiers.dart';
import 'package:invoiceapp/widgets/gradient_icon_widget.dart';

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

                  NavigationDestination(selectedIcon: GradientIconWidget(size: 50,
                    gradient: LinearGradient(
                        colors: [Color(0xFF4082E3),Color(0xFF9CD9FF)]
                    ),icon: Icons.add_circle,
                  ),

                      icon: GradientIconWidget(size: 60,
                        gradient: LinearGradient(
                            colors: [Color(0xFF4082E3),Color(0xFF9CD9FF)]
                        ),icon: Icons.add_circle,
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
                  previous_page.value=selected_page_notifier.value;
              
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
