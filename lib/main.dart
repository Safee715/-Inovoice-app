import 'package:DummyInvoice/pages/client_page/client_page_viewmodel.dart';
import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/pages/widget_tree_page.dart';
import 'package:provider/provider.dart';
void main() {

  runApp(
  MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ClientPageViewmodel(),),
  ],child: const Myapp(),
  ),

  );

}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageViewmodel homePageViewmodel=HomePageViewmodel();
    bool isDark =Theme.of(context).brightness==Brightness.dark;
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor:homePageViewmodel.getBackColor(isDark) ,
        useMaterial3: true,
        switchTheme: SwitchThemeData(
            trackColor: WidgetStateColor.resolveWith((states) {
              if(states.contains(WidgetState.selected))
                {

                  return Color(0xff4F94FB);
                }
              else
                {
                  return Colors.grey;
                }
            },
            ),
          thumbColor:WidgetStatePropertyAll(Color(0xffffffff)),
          trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),



      ),
        brightness: Brightness.light,
        fontFamily: 'Biennale',
      ),
      darkTheme: ThemeData(
        fontFamily: 'Biennale',
        brightness: Brightness.dark,
        useMaterial3: true,
        switchTheme: SwitchThemeData(
            trackColor: WidgetStateColor.resolveWith((states) {
              if(states.contains(WidgetState.selected))
              {

                return Color(0xff4F94FB);
              }
              else
              {
                return Colors.grey;
              }
            },
            ),
            thumbColor:WidgetStatePropertyAll(Color(0xffffffff)),
            trackOutlineColor: WidgetStatePropertyAll(Colors.transparent)

        ),
      ),
      debugShowCheckedModeBanner: false,
      home: WidgetTreePage(),
      themeMode: ThemeMode.system,
    );
  }
}
