import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:DummyInvoice/widgets/bar_chart/bar_chart_viewmodel.dart';
import 'package:DummyInvoice/widgets/bar_chart/draw_bars.dart';
import 'package:DummyInvoice/widgets/bar_chart/draw_labels.dart';
import 'package:DummyInvoice/widgets/bar_chart/draw_labels2.dart';
import 'package:DummyInvoice/widgets/bar_chart/draw_xlabels.dart';
import 'package:flutter/material.dart';

class BarChartsWidget extends StatefulWidget {
  const BarChartsWidget({super.key});

  @override
  State<BarChartsWidget> createState() => _BarChartsWidgetState();
}

class _BarChartsWidgetState extends State<BarChartsWidget> {
  int selected_key = 0;

  @override
  Widget build(BuildContext context) {
    HomePageViewmodel homePageViewmodel=HomePageViewmodel();
    BarChartViewmodel barChartViewmodel=BarChartViewmodel(context :context);

    return Container(

      child: Column(
        children: [
          Container(padding: EdgeInsets.only(left: 20,top: 20,right: 20,bottom:   30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Income Overview',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff303744),
                    fontFamily: 'Biennale',
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
            
                    border: Border.all(color: Color(0xff8D8F99)),
                  ),
            
                  child: DropdownButton(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    isDense: true,
                    underline: Container(height: 1),
                    borderRadius: BorderRadius.circular(20),
                    style: TextStyle(
                      fontSize: 12,
                      backgroundColor: Colors.transparent,
                      color: Color(0xff303744),
                      fontFamily: 'Biennale',
                    ),
                    icon: Icon(Icons.keyboard_arrow_down_rounded),
            
                    items: [
                      DropdownMenuItem(value: 0, child: Text('Last Week')),
                      DropdownMenuItem(value: 1, child: Text('This Week')),
                    ],
                    onChanged: (newValue) {
                      setState(() {
                        selected_key = newValue!;
                      });
                    },
                    value: selected_key,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1,color: Color(0xffEBECF2),thickness: 1,),
          Container(
            padding: EdgeInsets.only(top: 40,left: 0),
            child:
            Row(
              children: [
                Container(padding: EdgeInsets.only(right: homePageViewmodel.getWidth(context, 10),),
                  width: homePageViewmodel.getWidth(context, 30),
                  height: homePageViewmodel.getHeight(context,298 ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return CustomPaint(
                        size: Size(constraints.maxWidth, constraints.maxHeight),
                        painter: DrawLabels(barChartViewmodel),

                      );
                    },
                  ),
                ),
                Expanded(
                      child: SizedBox(width:  homePageViewmodel.getWidth(context, 275),
                        height: homePageViewmodel.getHeight(context,287 ),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return CustomPaint(
                              size: Size(constraints.maxWidth, constraints.maxHeight),
                              painter: DrawBars(barChartViewmodel),
                            );
                          },
                        ),
                      ),
                ),
                Container(padding: EdgeInsets.only(right: homePageViewmodel.getWidth(context, 5),),
                  width: homePageViewmodel.getWidth(context, 37),
                  height: homePageViewmodel.getHeight(context,298 ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      print(constraints.maxWidth);
                      return CustomPaint(
                        size: Size(constraints.maxWidth, constraints.maxHeight),
                        painter: DrawLabels2(barChartViewmodel),

                      );
                    },
                  ),
                ),

              ],
            ),

          ),
          Container(
            padding: EdgeInsets.only(left: homePageViewmodel.getWidth(context, 10),
              right:homePageViewmodel.getWidth(context, 20),

            ),
            width: homePageViewmodel.getWidth(context, 298),
            height: homePageViewmodel.getWidth(context, 30),
          child: LayoutBuilder(builder: (context, constraints) {
            return CustomPaint(
              size: Size(constraints.maxWidth, constraints.maxHeight),
              painter: DrawXlabels(barChartViewmodel: barChartViewmodel),

            );
          },

          ),

          ),
        ],
      ),
    );
  }
}
