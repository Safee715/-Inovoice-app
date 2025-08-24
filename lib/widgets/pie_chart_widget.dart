import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:DummyInvoice/widgets/draw_pie_chart.dart';
import 'package:flutter/material.dart';

int selected_key = 0;

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({super.key});

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  @override
  Widget build(BuildContext context) {
    // PieChartViewmodel pieChartViewmodel =
    // PieChartViewmodel(screenHeight: MediaQuery.sizeOf(context).height,
    //     screenWidth:MediaQuery.sizeOf(context).width, );
     HomePageViewmodel homePageViewmodel=HomePageViewmodel(
      screenHeight: MediaQuery.sizeOf(context).height,
      screenWidth:MediaQuery.sizeOf(context).width,
    );
    bool isDark=Theme.of(context).brightness==Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 20.0,
        right: 20,
        bottom: 20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Income Overview',
                style: TextStyle(
                  fontSize: 14,
                  color: homePageViewmodel.getTextColor(isDark),
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
                    color: homePageViewmodel.getTextColor(isDark),
                    fontFamily: 'Biennale',
                  ),
                  icon: Icon(Icons.keyboard_arrow_down_rounded,
                    color:homePageViewmodel.getBottomContainerColor(isDark) ,),

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
          Container(
            margin: EdgeInsets.only(bottom: 20,top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(margin: EdgeInsets.only(bottom: 20,top: 30),
                  child: CustomPaint(
                    size: Size(
                        double.infinity,(298) ),
                    painter: DrawPieChart(
                      homePageViewmodel: homePageViewmodel,
                      dataMap: selected_key == 0
                          ? homePageViewmodel.dataMap1
                          : homePageViewmodel.dataMap2,
                      colorsList: homePageViewmodel.colorsList,
                    ),
                  ),
                ),SizedBox(height: homePageViewmodel.getWidth(40),),
                Container(
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: homePageViewmodel.getWidth(8),
                        backgroundColor: homePageViewmodel.colorsList[0],),
                      Text(' Paid',style: TextStyle( fontFamily: 'Biennale',
                        fontSize: 12,color: homePageViewmodel.getTextColor(isDark),
                        fontWeight: FontWeight.bold,),
                      ),SizedBox(width:  homePageViewmodel.getWidth(20),),
                      CircleAvatar(
                        radius: homePageViewmodel.getWidth(8),
                        backgroundColor: homePageViewmodel.colorsList[1],),
                      Text(' Due',style: TextStyle( fontFamily: 'Biennale',
                        fontSize: 12,color: homePageViewmodel.getTextColor(isDark),
                        fontWeight: FontWeight.bold,),),
                    ],
                  ),
                ),
              ],
            ),

          ),
        ],
      ),
    );
  }
}
