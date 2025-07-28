import 'package:flutter/material.dart';
import 'package:invoiceapp/data/notifiers.dart';
import 'package:invoiceapp/pages/Items_page.dart';
import 'package:invoiceapp/pages/add_clients_page.dart';
import 'package:invoiceapp/pages/clients_page.dart';
import 'package:invoiceapp/pages/home_page.dart';
import 'package:invoiceapp/pages/profile_page.dart';
// import 'package:invoiceapp/widgets/nav_bar_widget2.dart';
import 'package:invoiceapp/widgets/navbar_widget.dart';


class WidgetTreePage extends StatefulWidget {
  const WidgetTreePage({super.key});

  @override
  State<WidgetTreePage> createState() => _WidgetTreePageState();
}

class _WidgetTreePageState extends State<WidgetTreePage> {
  List<Widget> pages=[HomePage(),
    ClientsPage(),AddClientsPage(),
    ItemsPage(),ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: selected_page_notifier,
          builder: (context, index, child) {
            return pages.elementAt(index);

          },
      ),
        bottomNavigationBar: NavbarWidget(),
    );
  }
}
