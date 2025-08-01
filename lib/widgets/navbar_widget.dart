import 'package:flutter/material.dart';
import 'package:invoiceapp/data/notifiers.dart';
import 'package:invoiceapp/widgets/custom_icon_widget.dart';

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
            child: ClipRRect(borderRadius: BorderRadius.circular(20.0),
              child: NavigationBar(shadowColor: Colors.white,height: 74,
                destinations: [
                  NavigationDestination(selectedIcon: CustomIconWidget(
                  iconaddress: 'assets/images/icons/homepage.svg',
                  height: 24, weight: 24, color: Color(0xff6EAEF1),
              ) ,label: 'Home',
                      icon: CustomIconWidget(
                          iconaddress: 'assets/images/icons/home.svg',
                          height: 24, weight: 24, color: Colors.grey[500]),
                  ),
                  NavigationDestination(selectedIcon: CustomIconWidget(
                    iconaddress: 'assets/images/icons/users-group2.svg',
                    height: 24, weight: 24, color: Color(0xff6EAEF1),
                  ) ,label: 'Clients',
                    icon: CustomIconWidget(
                        iconaddress: 'assets/images/icons/users-group.svg',
                        height: 24, weight: 24,),
                  ),

                  NavigationDestination(
                      icon: CustomIconWidget(iconaddress: 'assets/images/icons/add clients.svg',
                          height: 50, weight: 50,
                      ),
                    label: "",
                      ),
                  NavigationDestination(
                    selectedIcon:Icon(Icons.shopping_cart_rounded,
                      color: Color(0xff6EAEF1),
                  ),
                   label: 'Items',
                    icon: CustomIconWidget(
                        iconaddress: 'assets/images/icons/shopping-cart-plus.svg',
                        height: 24, weight: 24, color: Colors.grey[500]),
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(Icons.person_rounded,
                    color: Color(0xff6EAEF1),) ,
                  label: 'Profile',
                    icon: CustomIconWidget(
                        iconaddress: 'assets/images/icons/user.svg',
                        height: 24, weight: 24, color: Colors.grey[500]),
                  ),

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
