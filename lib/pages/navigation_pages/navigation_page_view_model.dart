import 'package:DummyInvoice/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/pages/navigation_pages/sub_navigation_page.dart';
import 'package:DummyInvoice/pages/items_page/Items_page.dart';
import 'package:DummyInvoice/pages/add_clients_page/add_clients_page.dart';
import 'package:DummyInvoice/pages/profile_page/profile_page.dart';
import 'package:DummyInvoice/pages/client_page/clients_page.dart';
import 'package:DummyInvoice/pages/templates_page/template_page.dart';


class NavigationPageViewModel
{
  List<Widget> pages = [
    HomePage(),
    SubNavigationPage(),
    AddClientsPage(),
    ItemsPage(),
    ProfilePage(),
  ];
  List<Widget> sub_Navigation_Pages=[
    TemplatePage(),
    ClientsPage(),
    ItemsPage()
  ];
}
