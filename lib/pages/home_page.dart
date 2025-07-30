import 'package:flutter/material.dart';
import 'package:invoiceapp/data/notifiers.dart';
import 'package:invoiceapp/widgets/bar_charts_widget.dart';
import 'package:invoiceapp/widgets/custom_icon_widget.dart';
import 'package:invoiceapp/widgets/details_data_widget.dart';
import 'package:invoiceapp/widgets/drafts_widget.dart';
import 'package:invoiceapp/widgets/navbar_widget.dart';
import 'package:invoiceapp/widgets/pie_chart_widget.dart';
import 'package:invoiceapp/widgets/recent_invoices_widget.dart';
List<Widget> widgets=[DetailsDataWidget(),BarChartsWidget(),PieChartWidget()];

// int widget_selected =selected_widget_notifier.value;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: Text(
          'Invoice Maker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(onPressed: () {}, icon:
        CustomIconWidget(iconaddress: 'assets/images/icons/menu-left-alt.svg',
            height:24, weight: 24, color: Colors.black)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20.0),
                height: 376.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    ValueListenableBuilder(valueListenable: selected_widget_notifier,
                      builder: (context, selected_widget, child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(onPressed: (){
                              selected_widget_notifier.value=0;
                            }, icon: CustomIconWidget(
                                iconaddress: 'assets/images/icons/homepage details.svg',
                                height: 18, weight: 18,
                              color: selected_widget==0?Colors.blue:Colors.grey,)


                            ),
                            IconButton(onPressed: (){
                              selected_widget_notifier.value=1;
                            }, icon:
                            CustomIconWidget(
                              iconaddress: 'assets/images/icons/chart-bar.svg',
                              height: 18, weight: 18,
                              color: selected_widget==1?Colors.blue:Colors.grey,),
                            ),
                            IconButton(onPressed: (){
                              selected_widget_notifier.value=2;
                            }, icon:CustomIconWidget(
                                iconaddress: 'assets/images/icons/pie chart.svg',
                                height: 18, weight: 18,
                                color: selected_widget==2?Colors.blue:Colors.grey,)


                            ),
                          ],
                        );
                      },

                    ),
                    ValueListenableBuilder(
                      valueListenable: selected_widget_notifier,
                      builder: (context, selected_widget, child) {
                        return widgets.elementAt(selected_widget);
                      },),
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  'Recent Invoices',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                ),
              ),
              Container(padding: EdgeInsets.all(20.0),
                height: 163.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: RecentInvoicesWidget(),

              ),
              ListTile(
                title: Text(
                  'Drafts',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                ),
              ),

              Container(padding: EdgeInsets.all(20.0),
                height: 163.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: DraftsWidget(),
              ),
            ],
          ),
        ),
      ),
bottomNavigationBar: Padding(
  padding: const EdgeInsets.only(bottom: 30.0,left: 30,right: 30,),
  child: NavbarWidget(),
),
      


    );
  }
}
