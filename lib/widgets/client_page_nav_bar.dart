import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/data/notifiers.dart';
import 'package:DummyInvoice/widgets/custom_icon_widget.dart';

class ClientPageNavBar extends StatefulWidget {
  const ClientPageNavBar({super.key});

  @override
  State<ClientPageNavBar> createState() => _ClientPageNavBarState();
}

class _ClientPageNavBarState extends State<ClientPageNavBar> {
  @override
  Widget build(BuildContext context) {
    HomePageViewmodel homePageViewmodel=HomePageViewmodel();
    bool isDark =Theme.of(context).brightness==Brightness.dark;
    return ValueListenableBuilder(
      valueListenable: client_page_index,
      builder: (context, index, child) {
           return SafeArea(
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
              BoxShadow(spreadRadius: 0,
                color:Colors.black.withValues(alpha: 0.1),
                offset: Offset(0,1),
                blurRadius: 5,
              )]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: NavigationBar(
                height: 74,
                backgroundColor:homePageViewmodel.getNavbarColor(isDark),
                indicatorColor: Colors.transparent,
                  destinations: [
                    NavigationDestination(
                        selectedIcon: CustomIconWidget(
                          iconaddress: 'assets/images/icons/Component 1.svg',
                          height: 18, weight: 18,
                        ) ,label: 'Templates',
                      icon: CustomIconWidget(
                        iconaddress: 'assets/images/icons/templates.svg',
                        height: 24, weight: 24,
                      color: homePageViewmodel.getNavbarIconColor(isDark),
                      ),
                    ),
                    NavigationDestination(
                        selectedIcon: CustomIconWidget(
                          iconaddress: 'assets/images/icons/users-group2.svg',
                          height: 24, weight: 24, color: Color(0xff6EAEF1),
                        ) ,label: 'Clients',
                      icon: CustomIconWidget(
                        iconaddress: 'assets/images/icons/users-group.svg',
                        height: 24, weight: 24,color:  homePageViewmodel.getNavbarIconColor(isDark),),
                    ),
                    NavigationDestination(
                        selectedIcon:Icon(Icons.shopping_cart_rounded,
                          color: Color(0xff6EAEF1),
                        ),
                      label: 'Items',
                      icon: CustomIconWidget(
                          iconaddress: 'assets/images/icons/shopping-cart-plus.svg',
                          height: 24, weight: 24, color: homePageViewmodel.getNavbarIconColor(isDark)
                      ),
                    ),

                  ],

                onDestinationSelected: (int value) {
                  client_page_index.value=value;

                },
                selectedIndex: index,
                labelTextStyle:WidgetStateTextStyle.resolveWith(
                      (states) {
                    TextStyle textStyle;
                    if(states.contains(WidgetState.selected))
                    {
                      textStyle= TextStyle(fontSize: 12,
                          color: homePageViewmodel.getTextColor(isDark),
                          fontWeight: FontWeight.bold);
                    }
                    else
                    {
                      textStyle =TextStyle(fontSize: 12,color: homePageViewmodel.getNavbarIconColor(isDark));
                    }
                    return textStyle;

                  },
                ),


              ),
            ),
          ),
      );
      },
    );

  }
}
