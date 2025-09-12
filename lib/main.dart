import 'dart:ui' ;
import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/themes.dart';
import 'package:DummyInvoice/data/languages/language_manager.dart';
import 'package:DummyInvoice/pages/add_clients_page/viewmodel/add_client_viewmodel.dart';
import 'package:DummyInvoice/pages/add_items_page/viewmodel/add_items_viewmodel.dart';
import 'package:DummyInvoice/pages/add_profile_page/viewmodel/addprofileviewmodel.dart';
import 'package:DummyInvoice/pages/client_page/repo/clients_page_repo.dart';
import 'package:DummyInvoice/pages/client_page/viewmodel/client_page_viewmodel.dart';
import 'package:DummyInvoice/pages/client_view_details_page/viewmodel/view_details_viewmodel.dart';
import 'package:DummyInvoice/pages/edit_details_page/viewmodel/edit_client_viewmode.dart';
import 'package:DummyInvoice/pages/edit_items_page/viewmodel/edit_item_viewmodel.dart';
import 'package:DummyInvoice/pages/edit_profile_page/viewmodel/editprofileviewmodel.dart';
import 'package:DummyInvoice/pages/home_page/viewmodel/home_page_viewmodel.dart';
import 'package:DummyInvoice/pages/items_page/repo/item_page_repository.dart';
import 'package:DummyInvoice/pages/items_page/viewmodel/items_page_viewmodel.dart';
import 'package:DummyInvoice/pages/itemsdetailspage/viewmodel/view_item_details_viewmodel.dart';
import 'package:DummyInvoice/pages/onboardingScreens/onboarding_page.dart';
import 'package:DummyInvoice/pages/onboardingScreens/viewmodel/onboarding_page_viewmodel.dart';
import 'package:DummyInvoice/pages/profile_page/viewmodel/profile_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:provider/provider.dart';
String deviceLang=PlatformDispatcher.instance.locale.languageCode;
bool isRtl()
{
  final locale=PlatformDispatcher.instance.locale;
  return Bidi.isRtlLanguage(locale.languageCode);
}

void main() {
  debugProfileBuildsEnabled=true;
LanguageManager.init(deviceLang);
Constants constants=Constants();
ClientsPageRepo clientsPageRepo=ClientsPageRepo();
ItemPageRepository itemPageRepository=ItemPageRepository();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => HomePageViewmodel(context: context, constant: constants),),
      ChangeNotifierProvider(create: (context) => ClientPageViewmodel(context, clientsPageRepo),),
      ChangeNotifierProvider(create: (context) => ItemsPageViewmodel(itemPageRepository),),
      ChangeNotifierProvider(create: (context) => EditItemViewmodel( ),),
      ChangeNotifierProvider(create: (context) => ViewItemsDetailsViewmodel(),),
      ChangeNotifierProvider(create: (context) => AddItemsViewmodel(),),
      ChangeNotifierProvider(create: (context) => EditClientViewmodel( ),),
      ChangeNotifierProvider(create: (context) => ViewDetailsViewmodel(),),
      ChangeNotifierProvider(create: (context) => AddClientViewmodel(),),
      ChangeNotifierProvider(create: (context) => OnboardingPageViewmodel(),),
      ChangeNotifierProvider(create: (context) => ProfilePageViewmodel(),),
      ChangeNotifierProvider(create: (context) => AddProfileViewmodel(),),
      ChangeNotifierProvider(create: (context) => EditProfileViewmodel(),),
    ],
      child:  const Myapp(),
    )


  );
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Themes.getLightTheme(context),
      darkTheme: Themes.getDarkTheme(),
      debugShowCheckedModeBanner: false,
      home: const OnboardingPage(),

      themeMode: ThemeMode.system,
    );
  }
}
