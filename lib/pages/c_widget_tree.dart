import 'package:DummyInvoice/widgets/client_page_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/data/notifiers.dart';
import 'package:DummyInvoice/pages/items_page/Items_page.dart';
import 'package:DummyInvoice/pages/client_page/clients_page.dart';
import 'package:DummyInvoice/pages/templates_page/template_page.dart';

class CWidgetTree extends StatefulWidget {
  const CWidgetTree({super.key});

  @override
  State<CWidgetTree> createState() => _CWidgetTreeState();
}
class _CWidgetTreeState extends State<CWidgetTree> {
  List<Widget> client_pages=[
    TemplatePage(),
    ClientsPage(),
    ItemsPage()
  ];
  @override
  Widget build(
      BuildContext context
      ) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: client_page_index,
        builder: (context, c_selected_page, child) {
          return AnimatedSwitcher(
            duration: Duration(
                milliseconds: 500),
          transitionBuilder: (child, animation) {

           return ScaleTransition(scale: animation,alignment: Alignment.center,
           child: child);
          },
            child: client_pages[c_selected_page],
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only( left: 50, right: 50),
        child: ClientPageNavBar(),
      ),
    );
  }
}
