import 'package:DummyInvoice/data/helpers/common_functions.dart';
import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/pages/navigation_pages/viewmodel/navigation_page_view_model.dart';
import 'package:DummyInvoice/widgets/navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/data/notifiers.dart';
import 'package:flutter/services.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key,
    required this.constant,
  });
final Constants constant;


  @override
  State<MainNavigationPage> createState() =>
      _MainNavigationPageState();
}

class _MainNavigationPageState
    extends State<MainNavigationPage> {
  NavigationPageViewModel navigationPageViewModel =NavigationPageViewModel();
CommonFunctions commonFunctions=CommonFunctions();
  @override
  Widget build(BuildContext context) {
    print('MainNavigationPage');
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async{
      if(didPop)
      {
        return;
      }
      if(selected_page_notifier.value==0)
      {
        bool goBack=await commonFunctions.showSecurityPrompt(context);
        if(goBack)
        {
          SystemNavigator.pop();

        }
      }
      else
      {
        selected_page_notifier.value=0;
      }
    },
    child: Scaffold(
      body: ValueListenableBuilder(
        valueListenable: selected_page_notifier,
        builder: (context, index, child) {
          return navigationPageViewModel
              .pages[index];
        },
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: selected_page_notifier,
        builder: (context, value, child) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: 30.0,
                left: 30,
                right: 30,
              ),
              child: NavbarWidget(),
            );

        },
      ),
    ),
    );
  }
}
