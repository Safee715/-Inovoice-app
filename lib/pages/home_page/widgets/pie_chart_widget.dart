import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/data/languages/language_manager.dart';
import 'package:DummyInvoice/pages/home_page/viewmodel/home_page_viewmodel.dart';
import 'package:DummyInvoice/pages/home_page/widgets/draw_pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:provider/provider.dart';

int selected_key = 0;

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({super.key,
  required this.constant
  });
  final Constants constant;

  @override
  State<PieChartWidget> createState() =>
      _PieChartWidgetState();
}

class _PieChartWidgetState
    extends State<PieChartWidget> {
  @override
  Widget build(BuildContext context) {
    final  homePageViewmodel =context.watch<HomePageViewmodel>();


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
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.constant.incomeOverviewText,
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(
                    context,
                  ).getTextColor(),
                  fontFamily: 'Biennale',
                ),
              ),
              Container(
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.transparent,
                  borderRadius:
                      BorderRadius.circular(30),

                  border: Border.all(
                    color: const Color(0xff8D8F99),
                  ),
                ),

                child: DropdownButton(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  isDense: true,
                  underline: Container(height: 1),
                  borderRadius:
                      BorderRadius.circular(20),
                  style: TextStyle(
                    fontSize: 12,
                    backgroundColor:
                        Colors.transparent,
                    color: Theme.of(
                      context,
                    ).getTextColor(),
                    fontFamily: 'Biennale',
                  ),
                  icon: Icon(
                    Icons
                        .keyboard_arrow_down_rounded,
                    color: Theme.of(
                      context,
                    ).getTextFormFieldColor(),
                  ),

                  items: [
                    DropdownMenuItem(
                      value: 0,
                      child: Text(widget.constant.dropDownMenuTexts[1]),
                    ),
                    DropdownMenuItem(
                      value: 1,
                      child: Text(widget.constant.dropDownMenuTexts[0]),
                    ),
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
            margin: const EdgeInsets.only(
              bottom: 20,
              top: 30,
            ),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    top: 30,
                  ),
                  child: CustomPaint(
                    size: const Size(
                      double.infinity,
                      (298),
                    ),
                    painter: DrawPieChart(
                      homePageViewmodel:
                          homePageViewmodel,
                      dataMap: selected_key == 0
                          ? homePageViewmodel
                                .getDataMap1()
                          : homePageViewmodel
                                .getDataMap2(),
                      colorsList:
                          homePageViewmodel
                              .colorsList,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.getWidth(40),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius:8,
                        backgroundColor:
                            homePageViewmodel
                                .colorsList[0],
                      ),
                      Text(
                       LanguageManager.translate('Paid'),
                        style: TextStyle(
                          fontFamily: 'Biennale',
                          fontSize: 12,
                          color: Theme.of(
                            context,
                          ).getTextColor(),
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: context.getWidth(
                          20,
                        ),
                      ),
                      CircleAvatar(
                        radius:8,
                        backgroundColor:
                            homePageViewmodel
                                .colorsList[1],
                      ),
                      Text(
                        LanguageManager.translate('Due'),
                        style: TextStyle(
                          fontFamily: 'Biennale',
                          fontSize: 12,
                          color: Theme.of(
                            context,
                          ).getTextColor(),
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
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
