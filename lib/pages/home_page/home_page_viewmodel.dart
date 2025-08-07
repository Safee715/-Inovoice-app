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
  final String notificationButtonAddress = 'assets/images/icons/bell-notification.svg';
  final String homePageDetailsAddress = 'assets/images/icons/homepage details.svg';
  final String BarChartAddress = 'assets/images/icons/chart-bar.svg';
  final String PieChartAddress = 'assets/images/icons/pie chart.svg';

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
}


