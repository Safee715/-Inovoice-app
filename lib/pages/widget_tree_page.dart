import 'package:flutter/material.dart';
import 'package:invoiceapp/data/notifiers.dart';
import 'package:invoiceapp/pages/Items_page.dart';
import 'package:invoiceapp/pages/add_clients_page.dart';
import 'package:invoiceapp/pages/c_widget_tree.dart';
import 'package:invoiceapp/pages/home_page.dart';
import 'package:invoiceapp/pages/profile_page.dart';


class WidgetTreePage extends StatefulWidget {
  const WidgetTreePage({super.key});

  @override
  State<WidgetTreePage> createState() => _WidgetTreePageState();
}

class _WidgetTreePageState extends State<WidgetTreePage> {
  List<Widget> pages=[HomePage(),
    CWidgetTree(),AddClientsPage(),
    ItemsPage(title: 'Items'),ProfilePage()
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
