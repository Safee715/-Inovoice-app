import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:DummyInvoice/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/data/notifiers.dart';
import 'package:DummyInvoice/widgets/client_page_nav_bar.dart';

class ItemsPage extends StatefulWidget {
   ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {

  @override
  Widget build(BuildContext context) {
    HomePageViewmodel homePageViewmodel=HomePageViewmodel();
    bool isDark =Theme.of(context).brightness==Brightness.dark;
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFE7EBF2),
        leading: IconButton(
          onPressed: () {
            selected_page_notifier.value = 0;
          },
          icon: Icon(Icons.arrow_back_ios_outlined,
            color: homePageViewmodel.getTextColor(isDark),),
        ),title:  Text('Items',
            style: TextStyle(color:homePageViewmodel.getTextColor(isDark) ,
                fontSize: 24, fontWeight: FontWeight.bold),

        ),
      ),
      body: Container(),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 30.0, left: selected_page_notifier.value==3?30:50, right:selected_page_notifier.value==3?30: 50),
        child: selected_page_notifier.value==3?NavbarWidget():ClientPageNavBar(),
      ),
    );
  }
}
