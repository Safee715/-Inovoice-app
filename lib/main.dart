import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/pages/navigation_pages/view/main_navigation_page.dart';

void main() {
  runApp(

      const Myapp(),

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
    final Constants constants=Constants();

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
      home: MainNavigationPage(constant: constants,),
      themeMode: ThemeMode.system,
    );
  }
}
