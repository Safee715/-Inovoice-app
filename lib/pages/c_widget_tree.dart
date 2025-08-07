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
    TemplatePage(title: 'Templates'),
    ClientsPage(title: 'Clients'),
    ItemsPage(title: 'Items')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: client_page_index,
        builder: (context, c_selected_page, child) {
          return client_pages.elementAt(c_selected_page);
        },
      ),
    );
  }
}
