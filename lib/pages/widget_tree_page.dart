import 'package:flutter/material.dart';
import 'package:DummyInvoice/data/notifiers.dart';
import 'package:DummyInvoice/pages/items_page/Items_page.dart';
import 'package:DummyInvoice/pages/add_clients_page/add_clients_page.dart';
import 'package:DummyInvoice/pages/c_widget_tree.dart';
import 'package:DummyInvoice/pages/home_page/home_page.dart';
import 'package:DummyInvoice/pages/profile_page/profile_page.dart';


class WidgetTreePage extends StatefulWidget {
  const WidgetTreePage({super.key});

  @override
  State<WidgetTreePage> createState() => _WidgetTreePageState();
}

class _WidgetTreePageState extends State<WidgetTreePage> {
  List<Widget> pages=[HomePage(),
    CWidgetTree(),AddClientsPage(),
    ItemsPage(),ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: selected_page_notifier,
          builder: (context, index, child)
          {
            return pages.elementAt(index);

          },
      ),
    );
  }
}
