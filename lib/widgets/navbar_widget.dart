import 'package:DummyInvoice/data/helpers/assets.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/data/languages/language_manager.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/data/notifiers.dart';
import 'package:DummyInvoice/widgets/custom_icon_widget.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder(
      valueListenable: selected_page_notifier,
      builder: (context, selected_page, child) {
        return SafeArea(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  spreadRadius: 0,
                  color: Colors.black.withValues(
                    alpha: 0.1,
                  ),
                  offset: const Offset(0, 1),
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
                destinations: [
                  NavigationDestination(
                    selectedIcon: CustomIconWidget(
                      iconaddress:
                      Assets.SelectedHomeIcon,                      height: 24,
                      weight: 24,
                      color: const Color(0xff6EAEF1),
                    ),
                    label: LanguageManager.translate('Home'),

                    icon: CustomIconWidget(
                      iconaddress:Assets.HomeIcon,
                      height: 24,
                      weight: 24,
                      color: Theme.of(context)
                          .getNavbarIconColor( ),
                    ),
                  ),
                  NavigationDestination(
                    selectedIcon: CustomIconWidget(
                      iconaddress:Assets.ClientsIconSelected,
                      height: 24,
                      weight: 24,
                      color: const Color(0xff6EAEF1),
                    ),
                    label: LanguageManager.translate('Clients'),
                    icon: CustomIconWidget(
                      iconaddress:
                      Assets.ClientsIcon,                      height: 24,
                      weight: 24,
                      color: Theme.of(context)
                          .getNavbarIconColor(),
                    ),
                  ),

                  NavigationDestination(
                    icon: Align(
                      alignment:
                          Alignment.bottomCenter,
                      child: CustomIconWidget(
                        iconaddress:Assets.AddButtonIcon,
                        height: 54,
                        weight: 54,
                      ),
                    ),
                    label: "",
                  ),
                  NavigationDestination(
                    selectedIcon: const Icon(
                      Icons.shopping_cart_rounded,
                      color: Color(0xff6EAEF1),
                    ),
                    label: LanguageManager.translate('Items'),
                    icon: CustomIconWidget(
                      iconaddress:
                      Assets.ItemsIcon,                      height: 24,
                      weight: 24,
                      color: Theme.of(context)
                          .getNavbarIconColor(
                          ),
                    ),
                  ),
                  NavigationDestination(
                    selectedIcon: const Icon(
                      Icons.person_rounded,
                      color: Color(0xff6EAEF1),
                    ),
                    label: LanguageManager.translate('Profile'),
                    icon: CustomIconWidget(
                      iconaddress:Assets.ProfileIcon,
                      height: 24,
                      weight: 24,
                      color: Theme.of(context)
                          .getNavbarIconColor(
                          ),
                    ),
                  ),
                ],
                backgroundColor: Theme.of(context)
                    .getNavbarColor(),
                onDestinationSelected:
                    (int value) {
                      selected_page_notifier
                              .value =
                          value;
                      previous_page.value =
                          selected_page_notifier
                              .value;
                    },
                selectedIndex: selected_page,
                indicatorColor:
                    Colors.transparent,
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
                          color: Theme.of(context)
                              .getTextColor(
                              ),
                          fontWeight:
                              FontWeight.bold,
                        );
                      } else {
                        textStyle = TextStyle(
                          fontSize: 12,
                          color: Theme.of(context)
                              .getNavbarIconColor(
                              ),
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
