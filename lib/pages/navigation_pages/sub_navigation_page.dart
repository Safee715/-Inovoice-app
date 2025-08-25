import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/pages/navigation_pages/navigation_page_view_model.dart';
import 'package:DummyInvoice/widgets/client_page_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/data/notifiers.dart';

class SubNavigationPage extends StatefulWidget {
  const SubNavigationPage({super.key});

  @override
  State<SubNavigationPage> createState() =>
      _SubNavigationPageState();
}

class _SubNavigationPageState
    extends State<SubNavigationPage> {
  NavigationPageViewModel
  navigationPageViewModel =
      NavigationPageViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: client_page_index,
          builder: (context, c_selected_page, child) {
            return navigationPageViewModel
                .sub_Navigation_Pages[c_selected_page];
          },
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: 50,
            right: 50,
            bottom: context.getHeight(
              30,
            ),
          ),
          child: ClientPageNavBar(),
        ),
      ),
    );
  }
}
