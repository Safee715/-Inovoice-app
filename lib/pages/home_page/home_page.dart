import 'package:flutter/material.dart';
import 'package:DummyInvoice/data/notifiers.dart';
import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:DummyInvoice/widgets/bar_chart/bar_charts_widget.dart';
import 'package:DummyInvoice/widgets/custom_cuppertino_button.dart';
import 'package:DummyInvoice/widgets/custom_icon_widget.dart';
import 'package:DummyInvoice/widgets/data_widget.dart';
import 'package:DummyInvoice/widgets/drafts_widget/drafts_widget.dart';
import 'package:DummyInvoice/widgets/navbar_widget.dart';
import 'package:DummyInvoice/widgets/pie_chart/pie_chart_widget.dart';
import 'package:DummyInvoice/widgets/recent_invoices_widget/recent_invoices_widget.dart';

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

final HomePageViewmodel viewmodel= HomePageViewmodel();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        backgroundColor: Color(0xffF0F3F7),
        title: Text(
          viewmodel.appBar,
        style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xff303744),
              ),
            ),
        leading: IconButton(
          onPressed: () {},
          icon: CustomIconWidget(
            iconaddress: viewmodel.menuButtonAddress,
            height: 24,
            weight: 24,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CustomIconWidget(
              iconaddress: viewmodel.notificationButtonAddress,
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
                  left: viewmodel.getWidth(context, 15),
                  right: viewmodel.getWidth(context, 15),
                  bottom: viewmodel.getWidth(context, 15),
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
                        spacing: viewmodel.getWidth(context, 10),
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: viewmodel.getWidth(context, 10),),
                          ValueListenableBuilder(
                            valueListenable: selected_widget_notifier,
                            builder: (context, selected_widget, child) {

                              return Row(
                                spacing: viewmodel.getWidth(context, 5),
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                 CustomCuppertinoButton(
                                     iconAddress: viewmodel.homePageDetailsAddress,
                                     onPressed: (){viewmodel.setHomePageDetails();},
                                   index: 0,),
                                  CustomCuppertinoButton(
                                      iconAddress: viewmodel.BarChartAddress,
                                      onPressed: (){viewmodel.setBarChartDetails();},
                                    index: 1,

                                  ),
                                  CustomCuppertinoButton(
                                      iconAddress: viewmodel.PieChartAddress,
                                      onPressed: (){viewmodel.setPieChartDetails();},
                                  index: 2,),
                                  SizedBox(width:viewmodel.getWidth(context, 15),),
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
                          viewmodel.recentInvoices,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
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
                            viewmodel.viewAll,
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
                      padding: EdgeInsets.symmetric(horizontal: viewmodel.getWidth(context, 20),
                          vertical: viewmodel.getWidth(context, 8),),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: RecentInvoicesWidget(),
                    ),
                    Text(
                      viewmodel.drafts,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xff303744),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: viewmodel.getWidth(context, 20),
                          vertical: viewmodel.getWidth(context, 8),
                      ),
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
        padding: EdgeInsets.only(
            bottom: 30.0, left: 30, right: 30),
        child: NavbarWidget(),
      ),
    );
  }
}
