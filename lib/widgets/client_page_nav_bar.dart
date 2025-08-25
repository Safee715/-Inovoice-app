import 'package:DummyInvoice/data/helpers/assets.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/data/notifiers.dart';
import 'package:DummyInvoice/widgets/custom_icon_widget.dart';

class ClientPageNavBar extends StatefulWidget {
  const ClientPageNavBar({super.key});

  @override
  State<ClientPageNavBar> createState() =>
      _ClientPageNavBarState();
}

class _ClientPageNavBarState
    extends State<ClientPageNavBar> {
  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder(
      valueListenable: client_page_index,
      builder: (context, index, child) {
        return SafeArea(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  spreadRadius: 0,
                  color: Colors.black.withValues(
                    alpha: 0.1,
                  ),
                  offset: Offset(0, 1),
                  blurRadius: 5,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
              child: NavigationBar(
                height: 74,
                backgroundColor:  Theme.of(context)
                    .getNavbarColor(),
                indicatorColor:
                    Colors.transparent,
                destinations: [
                  NavigationDestination(
                    selectedIcon: CustomIconWidget(
                      iconaddress:
                          Assets.TemplateIconSelected,
                      height: 18,
                      weight: 18,
                    ),
                    label: 'Templates',
                    icon: CustomIconWidget(
                      iconaddress:
                      Assets.TemplateIconUnSelected,
                      height: 24,
                      weight: 24,
                      color:  Theme.of(context)
                          .getNavbarIconColor(

                          ),
                    ),
                  ),
                  NavigationDestination(
                    selectedIcon: CustomIconWidget(
                      iconaddress:
                      Assets.ClientsIconSelected,                      height: 24,
                      weight: 24,
                      color: Color(0xff6EAEF1),
                    ),
                    label: 'Clients',
                    icon: CustomIconWidget(
                      iconaddress:
                      Assets.ClientsIconUnSelected,                      height: 24,
                      weight: 24,
                      color:  Theme.of(context)
                          .getNavbarIconColor(
                          ),
                    ),
                  ),
                  NavigationDestination(
                    selectedIcon: Icon(
                      Icons.shopping_cart_rounded,
                      color: Color(0xff6EAEF1),
                    ),
                    label: 'Items',
                    icon: CustomIconWidget(
                      iconaddress:
                      Assets.ItemsIconUnSelected,                      height: 24,
                      weight: 24,
                      color:  Theme.of(context)
                          .getNavbarIconColor(  ),
                    ),
                  ),
                ],

                onDestinationSelected:
                    (int value) {
                      client_page_index.value =
                          value;
                    },
                selectedIndex: index,
                labelTextStyle:
                    WidgetStateTextStyle.resolveWith((
                      states,
                    ) {
                      TextStyle textStyle;
                      if (states.contains(
                        WidgetState.selected,
                      )) {
                        textStyle = TextStyle(
                          fontSize: 12,
                          color:  Theme.of(context)
                              .getTextColor(),
                          fontWeight:
                              FontWeight.bold,
                        );
                      } else {
                        textStyle = TextStyle(
                          fontSize: 12,
                          color:  Theme.of(context)
                              .getNavbarIconColor(),
                        );
                      }
                      return textStyle;
                    }),
              ),
            ),
          ),
        );
      },
    );
  }
}
