import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:flutter/material.dart';

class Themes {
  static ThemeData getLightTheme (BuildContext context) {
  return  ThemeData(
      scaffoldBackgroundColor: Theme.of(
        context,
      ).getBackColor(),
      useMaterial3: true,
      switchTheme: SwitchThemeData(
        trackColor: WidgetStateColor.resolveWith((
          states,
        ) {
          if (states.contains(
            WidgetState.selected,
          )) {
            return const Color(0xff4F94FB);
          } else {
            return Colors.grey;
          }
        }),
        thumbColor: const WidgetStatePropertyAll(
          Color(0xffffffff),
        ),
        trackOutlineColor:
            const WidgetStatePropertyAll(
              Colors.transparent,
            ),
      ),
      brightness: Brightness.light,
      fontFamily: 'Biennale',
    );
  }
  static  ThemeData getDarkTheme () {
    return ThemeData(
      fontFamily: 'Biennale',
      brightness: Brightness.dark,
      useMaterial3: true,
      switchTheme: SwitchThemeData(
        trackColor: WidgetStateColor.resolveWith((
          states,
        ) {
          if (states.contains(
            WidgetState.selected,
          )) {
            return const Color(0xff4F94FB);
          } else {
            return Colors.grey;
          }
        }),
        thumbColor: const WidgetStatePropertyAll(
          Color(0xffffffff),
        ),
        trackOutlineColor:
            const WidgetStatePropertyAll(
              Colors.transparent,
            ),
      ),
    );
  }
}
