import 'package:flutter/cupertino.dart';
import 'package:DummyInvoice/data/notifiers.dart';


class HomePageViewmodel {

  //variables
  final String appBar = 'Invoice Maker';
  final String recentInvoices = 'Recent Invoice';
  final String viewAll = 'View All';
  final String drafts = 'Drafts';


  //address
  final String menuButtonAddress = 'assets/images/icons/menu-left-alt.svg';
  // final String notificationButtonAddress = 'assets/images/icons/bell-notification.svg';
  final String homePageDetailsAddress = 'assets/images/icons/homepage details.svg';
  final String BarChartAddress = 'assets/images/icons/chart-bar.svg';
  final String PieChartAddress = 'assets/images/icons/pie chart.svg';
String getNotificationIcon(bool isDark)
{return isDark?'assets/images/icons/dark_bell-notification.svg':'assets/images/icons/bell-notification.svg';

}

  //functions
  void setHomePageDetails() {
    selected_widget_notifier.value = 0;
  }

  void setBarChartDetails() {
    selected_widget_notifier.value = 1;
  }

  void setPieChartDetails() {
    selected_widget_notifier.value = 2;
  }


  double getHeight(BuildContext context, double figmaHeight,) {
    double height = (figmaHeight / 1046) * MediaQuery
        .of(context)
        .size
        .height;
    return height;
  }

  double getWidth(BuildContext context, double figmaWidth,) {
    double width = (figmaWidth / 412) * MediaQuery
        .of(context)
        .size
        .width;
    return width;
  }
  Color  getBackColor(bool isDark)
  {
     Color color=isDark?Color(0xff090A0E):Color(0xffF0F3F7);
     return color;
  }
  Color  getTextColor(bool isDark)
  {
    return isDark?Color(0xffFFFFFF):Color(0xff303744);

  }
  Color  getContainerColor(bool isDark)
  {
    return isDark?Color(0xff0D0F14):Color(0xffFFFFFF);

  }
  Color  getTextFormFieldColor(bool isDark)
  {
    return isDark?Color(0xff171921):Color(0xFFD8DAE5);

  }

  Color  getBottomContainerColor(bool isDark)
  {
    return isDark?Color(0xff333747):Color(0xffFFFFFF);

  }
  Color  getNavbarColor(bool isDark)
  {
    return isDark?Color(0xff111319):Color(0xffFFFFFF);

  }
  Color  getNavbarIconColor(bool isDark)
  {
    return isDark?Color(0xff353A52):Color(0xff8D8F99);

  }
  Color  getHomePageIconColor(bool isDark)
  {
    return isDark?Color(0xff353A52):Color(0xffD6DAE0);

  }
  Color  getHintTextColor(bool isDark)
  {
    return isDark?Color(0xff353A4d):Color(0xffBEC0CC);

  }
String getIconAddress(bool isDark,String Dark,String Light)
{
  return isDark?Dark:Light;
}
}


