import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/pages/add_clients_page/view/add_clients_page.dart';
import 'package:DummyInvoice/pages/home_page/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/pages/navigation_pages/view/sub_navigation_page.dart';
import 'package:DummyInvoice/pages/items_page/view/Items_page.dart';
import 'package:DummyInvoice/pages/profile_page/view/profile_page.dart';
import 'package:DummyInvoice/pages/client_page/view/clients_page.dart';
import 'package:DummyInvoice/pages/templates_page/view/template_page.dart';

class NavigationPageViewModel {
  final Constants constants=Constants();
  List<Widget>get pages => [
    HomePage(),
    SubNavigationPage(),
    AddClientsPage(),
    ItemsPage(constants: constants,),
    ProfilePage(constants: constants,),
  ];
  List<Widget>get sub_Navigation_Pages => [
    TemplatePage(constants:constants ,),
    ClientsPage(),
    ItemsPage(constants: constants,),
  ];
}
