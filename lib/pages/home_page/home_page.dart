import 'package:flutter/material.dart';
import 'package:invoiceapp/data/notifiers.dart';
import 'package:invoiceapp/pages/home_page/home_page_viewmodel.dart';
import 'package:invoiceapp/widgets/bar_charts_widget.dart';
import 'package:invoiceapp/widgets/custom_cuppertino_button.dart';
import 'package:invoiceapp/widgets/custom_icon_widget.dart';
import 'package:invoiceapp/widgets/data_widget.dart';
import 'package:invoiceapp/widgets/drafts_widget/drafts_widget.dart';
import 'package:invoiceapp/widgets/navbar_widget.dart';
import 'package:invoiceapp/widgets/pie_chart_widget.dart';
import 'package:invoiceapp/widgets/recent_invoices_widget/recent_invoices_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      DataWidget(),
      BarChartsWidget(),
      PieChartWidget()];
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight =MediaQuery.of(context).size.height;
final HomePageViewmodel h1= HomePageViewmodel();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        backgroundColor: Color(0xffF0F3F7),
        title: Text(
        h1.appBar,
        style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xff303744),
              ),
            ),
        leading: IconButton(
          onPressed: () {},
          icon: CustomIconWidget(
            iconaddress: h1.menuButtonAddress,
            height: 24,
            weight: 24,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CustomIconWidget(
              iconaddress: h1.notificationButtonAddress,
              height: 24,
              weight: 24,
            ),
          ),
        ],
      ),

      body: SafeArea(
        top: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  left: screenWidth * 0.036,
                  right: screenWidth * 0.036,
                  bottom: screenWidth * 0.036,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: constraints.maxWidth,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(28)),
                      ),
                      child: Column(
                        spacing: screenWidth * 0.024,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: screenWidth * 0.024),
                          ValueListenableBuilder(
                            valueListenable: selected_widget_notifier,
                            builder: (context, selected_widget, child) {

                              return Row(
                                spacing: screenWidth * 0.012,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                 CustomCuppertinoButton(
                                     iconAddress: h1.homePageDetailsAddress,
                                     onPressed: (){h1.setHomePageDetails();},
                                   index: 0,),
                                  CustomCuppertinoButton(
                                      iconAddress: h1.BarChartAddress,
                                      onPressed: (){h1.setBarChartDetails();},
                                    index: 1,

                                  ),
                                  CustomCuppertinoButton(
                                      iconAddress: h1.PieChartAddress,
                                      onPressed: (){h1.setPieChartDetails();},
                                  index: 2,),
                                  SizedBox(width: screenWidth * 0.036),
                                ],
                              );
                            },
                          ),
                          ValueListenableBuilder(
                            valueListenable: selected_widget_notifier,
                            builder: (context, selected_widget, child) {
                              return widgets.elementAt(selected_widget);
                            },
                          ),
                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          h1.recentInvoices,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                            color: Color(0xff303744),
                          ),
                        ),

                        ElevatedButton.icon(
                          onPressed: () {},
                          iconAlignment: IconAlignment.end,
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.only(left: 10, right: 0),
                            backgroundColor: Color(0xffF0F3F7),
                            shadowColor: Colors.transparent,
                          ),
                          label: Text(
                            h1.viewAll,
                            style: TextStyle(
                              color: Color(0xff4F94FB),
                              fontSize: 16,
                            ),
                          ),
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20,
                            color: Color(0xff4F94FB),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: RecentInvoicesWidget(),
                    ),
                    Text(
                      h1.drafts,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                        color: Color(0xff303744),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: DraftsWidget(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 30.0, left: 30, right: 30),
        child: NavbarWidget(),
      ),
    );
  }
}
