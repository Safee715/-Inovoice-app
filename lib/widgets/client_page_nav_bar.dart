import 'package:flutter/material.dart';
import 'package:invoiceapp/data/notifiers.dart';
import 'package:invoiceapp/widgets/custom_icon_widget.dart';

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
                      selectedIcon: CustomIconWidget(
                        iconaddress: 'assets/images/icons/Component 1.svg',
                        height: 18, weight: 18,
                      ) ,label: 'Templates',
                    icon: CustomIconWidget(
                      iconaddress: 'assets/images/icons/templates.svg',
                      height: 24, weight: 24,),
                  ),
                  NavigationDestination(
                      selectedIcon: CustomIconWidget(
                        iconaddress: 'assets/images/icons/users-group2.svg',
                        height: 24, weight: 24, color: Color(0xff6EAEF1),
                      ) ,label: 'Clients',
                    icon: CustomIconWidget(
                      iconaddress: 'assets/images/icons/users-group.svg',
                      height: 24, weight: 24,),
                  ),
                  NavigationDestination(
                      selectedIcon:Icon(Icons.shopping_cart_rounded,
                        color: Color(0xff6EAEF1),
                      ),
                    label: 'Items',
                    icon: CustomIconWidget(
                        iconaddress: 'assets/images/icons/shopping-cart-plus.svg',
                        height: 24, weight: 24, color: Colors.grey[500]
                    ),
                  ),
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
