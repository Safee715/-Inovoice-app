import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/pages/client_page/client_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/pages/navigation_pages/main_navigation_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ClientPageViewmodel(),
        ),
      ],
      child: const Myapp(),
    ),
  );
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

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
      home: MainNavigationPage(constant:  constants,),
      themeMode: ThemeMode.system,
    );
  }
}
