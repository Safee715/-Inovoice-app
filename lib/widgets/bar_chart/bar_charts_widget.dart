import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
  import 'package:DummyInvoice/widgets/bar_chart/bar_chart_viewmodel.dart';
  import 'package:DummyInvoice/widgets/bar_chart/draw_bars.dart';
  
  import 'package:flutter/material.dart';
int selected_key = 0;

class BarChartsWidget extends StatefulWidget {
    const BarChartsWidget({super.key});

    @override
    State<BarChartsWidget> createState() => _BarChartsWidgetState();
  }
  
  class _BarChartsWidgetState extends State<BarChartsWidget> {

    @override
    Widget build(BuildContext context) {
      BarChartViewmodel barChartViewmodel=
      BarChartViewmodel(screenWidth: MediaQuery.sizeOf(context).width,
          screenHeight:MediaQuery.sizeOf(context).height );
      HomePageViewmodel homePageViewmodel=HomePageViewmodel();
      bool isDark =Theme.of(context).brightness==Brightness.dark;
      return Container(
  
        child: Column(
          children: [
            Container(padding: EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Income Overview',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Biennale',
                      color: homePageViewmodel.getTextColor(isDark),
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
                        color: homePageViewmodel.getTextColor(isDark),
                        fontFamily: 'Biennale',
                      ),
                      icon: Icon(Icons.keyboard_arrow_down_rounded,
                        color: homePageViewmodel.getBottomContainerColor(isDark),),

                      items: [
                        DropdownMenuItem(value: 0, child: Text('This Week')),
                        DropdownMenuItem(value: 1, child: Text('Last Week')),
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
              padding: EdgeInsets.only(top: homePageViewmodel.getWidth(context, 50),
                  left: homePageViewmodel.getWidth(context, 5),
                  bottom: homePageViewmodel.getWidth(context, 30),
                right: homePageViewmodel.getWidth(context, 5)
              ),
              child:
                TweenAnimationBuilder<double>(tween: Tween(begin: 0,end: 1),
                      duration: const Duration(seconds: 2),
                  curve: Curves.easeOut,
                  builder: (context, value, child)
                {
                    return  LayoutBuilder(builder: (context, constraints) {
                      return CustomPaint(
                      painter: DrawBars(barChartViewmodel,selected_key,selected_key==0?barChartViewmodel.data1:barChartViewmodel.data2),
                      size: Size(constraints.maxWidth, 237),

                    );
                  },
                  );
                },

                ),
            ),
          ],
        ),
      );
    }
  }
