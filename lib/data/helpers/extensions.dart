import 'package:flutter/material.dart';

extension contextExtension on BuildContext {
  bool isDark() =>
      Theme.of(this).brightness ==
      Brightness.dark;

  double getWidth(double figmaWidth) {
    double width =
        (figmaWidth / 412) *
        (MediaQuery.of(this).size.width);
    return width;
  }

  double getHeight(double figmaHeight) {
    double height =
        (figmaHeight / 1046) *
        (MediaQuery.of(this).size.height);
    return height;
  }
}

extension colors on ThemeData {
  Gradient getOnboardingScreenBackGradient() {
    return brightness == Brightness.dark
        ?  LinearGradient(
      colors: [
        Color(0xff4082E3),
        Color(0xff171921),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.0, 0.5],
    ): LinearGradient(
      colors: [
        Color(0xffD7E5FF),
        Color(0xffffffff),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.0, 0.5],
    );
  }
  Color getOnboardingCircleColor() {
    return brightness == Brightness.dark
        ? Color(0xff4082E3)
        : Color(0xffffffff);
  }
  Color getOnboardingTextColor() {
    return brightness == Brightness.dark
        ? Color(0xffBABBC4)
        : Color(0xff1F2937);
  }
  Color getBackColor() {
    return brightness == Brightness.dark
        ? Color(0xff090A0E)
        : Color(0xffF0F3F7);
  }

  Color getTextColor() {
    return brightness == Brightness.dark
        ? Color(0xffFFFFFF)
        : Color(0xff303744);
  }

  Color getContainerColor() {
    return brightness == Brightness.dark
        ? Color(0xff0D0F14)
        : Color(0xffFFFFFF);
  }

  Color getTextFormFieldColor() {
    return brightness == Brightness.dark
        ? Color(0xff171921)
        : Color(0xFFD8DAE5);
  }

  Color getBottomContainerColor() {
    return brightness == Brightness.dark
        ? Color(0xff333747)
        : Color(0xffFFFFFF);
  }

  Color getNavbarColor() {
    return brightness == Brightness.dark
        ? Color(0xff111319)
        : Color(0xffFFFFFF);
  }

  Color getNavbarIconColor() {
    return brightness == Brightness.dark
        ? Color(0xff353A52)
        : Color(0xff8D8F99);
  }

  Color getHomePageIconColor() {
    return brightness == Brightness.dark
        ? Color(0xff353A52)
        : Color(0xffD6DAE0);
  }

  Color getHintTextColor() {
    return brightness == Brightness.dark
        ? Color(0xff353A4d)
        : Color(0xffBEC0CC);
  } Color getAppBarBottomColor() {
    return brightness == Brightness.dark
        ? Color(0xff333747)
        : Color(0xff000000)
        .withValues(alpha: 0.05);
  }

  String getIconAddress(
    String Dark,
    String Light,
  ) {
    return brightness == Brightness.dark
        ? Dark
        : Light;
  }


  String getNotificationIcon() {
    return brightness == Brightness.dark
        ? 'assets/images/icons/dark_bell-notification.svg'
        : 'assets/images/icons/bell-notification.svg';
  }
  String getMenuIcon() {
    return brightness == Brightness.dark?
    'assets/images/icons/nightmode_menuButton.svg'
  :    'assets/images/icons/edit_delete_button.svg';

  }


}
