import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/pages/navigation_pages/sub_navigation_page.dart';
import 'package:DummyInvoice/pages/items_page/Items_page.dart';
import 'package:DummyInvoice/pages/add_clients_page/add_clients_page.dart';
import 'package:DummyInvoice/pages/profile_page/profile_page.dart';
import 'package:DummyInvoice/pages/client_page/clients_page.dart';
import 'package:DummyInvoice/pages/templates_page/template_page.dart';

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
