import 'package:DummyInvoice/widgets/home_page_menu_widgets_navigation.dart';
import 'package:DummyInvoice/widgets/pie_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/data/notifiers.dart';
import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:DummyInvoice/widgets/bar_charts_widget.dart';
import 'package:DummyInvoice/widgets/custom_icon_widget.dart';
import 'package:DummyInvoice/widgets/data_widget.dart';
import 'package:DummyInvoice/widgets/drafts_widget.dart';
import 'package:DummyInvoice/widgets/recent_invoices_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageViewmodel viewmodel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewmodel = HomePageViewmodel(
      screenWidth: MediaQuery.of(context).size.width,
      screenHeight: MediaQuery.of(context).size.height,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [DataWidget(), BarChartsWidget(), PieChartWidget()];
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        centerTitle: false,
        titleSpacing: 0,
        backgroundColor: viewmodel.getBackColor(isDark),
        title: Text(
          viewmodel.appBar,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: viewmodel.getTextColor(isDark),
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: CustomIconWidget(
            iconaddress: viewmodel.menuButtonAddress,
            height: 24,
            weight: 24,
            color: viewmodel.getTextColor(isDark),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CustomIconWidget(
              iconaddress: viewmodel.getNotificationIcon(isDark),
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
                  left: viewmodel.getWidth(15),
                  right: viewmodel.getWidth(15),
                  bottom: viewmodel.getWidth(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: constraints.maxWidth,
                      decoration: BoxDecoration(
                        color: viewmodel.getContainerColor(isDark),
                        borderRadius: BorderRadius.all(Radius.circular(28)),
                      ),
                      child: Column(
                        spacing: viewmodel.getWidth(10),
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: viewmodel.getWidth(10)),
                          ValueListenableBuilder(
                            valueListenable: selected_widget_notifier,
                            builder: (context, selected_widget, child) {
                              return HomePageMenuWidgetsNavigation();
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
                            color: viewmodel.getTextColor(isDark),
                          ),
                        ),

                        ElevatedButton.icon(
                          onPressed: () {},
                          iconAlignment: IconAlignment.end,
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.only(left: 10, right: 0),
                            backgroundColor: Colors.transparent,
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
                      padding: EdgeInsets.symmetric(
                        horizontal: viewmodel.getWidth(20),
                        vertical: viewmodel.getWidth(8),
                      ),
                      decoration: BoxDecoration(
                        color: viewmodel.getBottomContainerColor(isDark),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: RecentInvoicesWidget(),
                    ),
                    Text(
                      viewmodel.drafts,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: viewmodel.getTextColor(isDark),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: viewmodel.getWidth(20),
                        vertical: viewmodel.getWidth(8),
                      ),
                      decoration: BoxDecoration(
                        color: viewmodel.getBottomContainerColor(isDark),
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
    );
  }
}
