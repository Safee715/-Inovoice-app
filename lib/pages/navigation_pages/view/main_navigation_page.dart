import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/pages/navigation_pages/viewmodel/navigation_page_view_model.dart';
import 'package:DummyInvoice/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/data/notifiers.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key,required this.constant});
final Constants constant;
  @override
  State<MainNavigationPage> createState() =>
      _MainNavigationPageState();
}

class _MainNavigationPageState
    extends State<MainNavigationPage> {
  NavigationPageViewModel
  navigationPageViewModel =
      NavigationPageViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: selected_page_notifier,
        builder: (context, index, child) {
          return navigationPageViewModel
              .pages[index];
        },
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: selected_page_notifier,
        builder: (context, value, child) {
          if (value == 1) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: 30.0,
                left: 50,
                right: 50,
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.only(
                bottom: 30.0,
                left: 30,
                right: 30,
              ),
              child: NavbarWidget(),
            );
          }
        },
      ),
    );
  }
}
