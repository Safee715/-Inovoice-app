import 'dart:ui' ;
import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/data/languages/language_manager.dart';
import 'package:DummyInvoice/pages/home_page/viewmodel/home_page_viewmodel.dart';
import 'package:DummyInvoice/pages/onboardingScreens/onboarding_page1.dart';
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
LanguageManager.init(deviceLang);
Constants constants=Constants();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => HomePageViewmodel(context: context, constant: constants),)
      // ChangeNotifierProvider(create: (context) => HomePageViewmodel(context: context, constant: constants),)
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
      theme: ThemeData(
        scaffoldBackgroundColor: Theme.of(context)
            .getBackColor(),
        useMaterial3: true,
        switchTheme: SwitchThemeData(
          trackColor:
              WidgetStateColor.resolveWith((
                states,
              ) {
                if (states.contains(
                  WidgetState.selected,
                )) {
                  return Color(0xff4F94FB);
                } else {
                  return Colors.grey;
                }
              }),
          thumbColor: WidgetStatePropertyAll(
            Color(0xffffffff),
          ),
          trackOutlineColor:
              WidgetStatePropertyAll(
                Colors.transparent,
              ),
        ),
        brightness: Brightness.light,
        fontFamily: 'Biennale',
      ),
      darkTheme: ThemeData(
        fontFamily: 'Biennale',
        brightness: Brightness.dark,
        useMaterial3: true,
        switchTheme: SwitchThemeData(
          trackColor:
              WidgetStateColor.resolveWith((
                states,
              ) {
                if (states.contains(
                  WidgetState.selected,
                )) {
                  return Color(0xff4F94FB);
                } else {
                  return Colors.grey;
                }
              }),
          thumbColor: WidgetStatePropertyAll(
            Color(0xffffffff),
          ),
          trackOutlineColor:
              WidgetStatePropertyAll(
                Colors.transparent,
              ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: OnboardingPage1(),

      themeMode: ThemeMode.system,
    );
  }
}
