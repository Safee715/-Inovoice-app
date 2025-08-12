import 'package:DummyInvoice/widgets/pie_chart/pie_chart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({super.key});

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  int selected_key=0;


  @override
  Widget build(BuildContext context) {
    PieChartViewmodel pieChartViewmodel=PieChartViewmodel();
    return Padding(
      padding: const EdgeInsets.only(top: 10,left: 20.0,right: 20,bottom: 20),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,  
            children: [
              Text('Income Overview',style: TextStyle(
                fontSize: 14,color: Color(0xff303744),fontFamily: 'Biennale',),
              ),
              Container(padding: EdgeInsets.all(0),
                decoration: BoxDecoration(shape: BoxShape.rectangle,
                  color: Colors.transparent,
                borderRadius: BorderRadius.circular(30),

                  border: Border.all(color: Color(0xff8D8F99))
                ),

                child: DropdownButton(padding: EdgeInsets.only(left: 10,right: 10),isDense: true,underline: Container(height: 1,),
                  borderRadius:BorderRadius.circular(20),
                  style: TextStyle(fontSize: 12,backgroundColor: Colors.transparent,
                    color: Color(0xff303744),
                    fontFamily: 'Biennale',),icon: Icon(Icons.keyboard_arrow_down_rounded),

                  items:[
                  DropdownMenuItem(value: 0,
                      child: Text('Last Week'),
                  ),
                  DropdownMenuItem(value: 1,
                      child: Text('This Week'),
                  ),
                ], onChanged:
                (newValue) {
                  setState(() {
                    selected_key=newValue!;

                  }
                  );
                },
                  value: selected_key,

                ),
              ),

            ],
          ),
          Container(
              child:PieChart(
                chartValuesOptions: ChartValuesOptions(chartValueBackgroundColor: Colors.transparent,
                    chartValueStyle: TextStyle(
                    color: Color(0xffffffff),
                        backgroundColor: Colors.transparent,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,fontFamily: 'Biennale'
                    ),
                ),
                
                formatChartValues: (value) {
                  return 'PKR : ${pieChartViewmodel.currencyFormat.format(value)}';
                },
                  dataMap:pieChartViewmodel.dataMap.values.elementAt(selected_key),
                gradientList: pieChartViewmodel.colorsList,
                initialAngleInDegree: 0,
                chartRadius: pieChartViewmodel.chartRadius,
                animationDuration: Duration(milliseconds: 700),
                legendOptions: LegendOptions(
                    showLegendsInRow: true,legendPosition: LegendPosition.bottom,
                    legendTextStyle: TextStyle(
                        color: Color(0xff0F151F),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,

                    ),
                ),



              ),
          ),




        ],
      ),
    );



  }
}
