import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/pages/home_page/viewmodel/home_page_viewmodel.dart';
import 'package:DummyInvoice/pages/home_page/widgets/draw_bars.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BarChartsWidget extends StatefulWidget {
  const BarChartsWidget({
    super.key,
    required this.constants,
  });
final Constants constants;
  @override
  State<BarChartsWidget> createState() =>
      _BarChartsWidgetState();
}

class _BarChartsWidgetState
    extends State<BarChartsWidget> {
  int selected_key = 0;

  @override
  Widget build(BuildContext context) {
    final  homePageViewmodel =context.watch<HomePageViewmodel>();


    return Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              top: 20,
              right: 20,
              bottom: 20,
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.constants.incomeOverviewText,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Biennale',
                    color:  Theme.of(context)
                        .getTextColor(),
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
                    underline: Container(
                      height: 1,
                    ),
                    borderRadius:
                        BorderRadius.circular(20),
                    style: TextStyle(
                      fontSize: 12,
                      backgroundColor:
                          Colors.transparent,
                      color:  Theme.of(context)
                          .getTextColor(),
                      fontFamily: 'Biennale',
                    ),
                    icon: Icon(
                      Icons
                          .keyboard_arrow_down_rounded,
                      color:  Theme.of(context)
                          .getTextFormFieldColor(),
                    ),

                    items: [
                      DropdownMenuItem(
                        value: 0,
                        child: Text(widget.constants.dropDownMenuTexts[0],),
                      ),
                      DropdownMenuItem(
                        value: 1,
                        child: Text(widget.constants.dropDownMenuTexts[1],),
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
          ),
          const Divider(
            height: 1,
            color: Color(0xffEBECF2),
            thickness: 1,
          ),
          Container(
            padding: EdgeInsets.only(
              top: context.getWidth(50),
              left: context.getWidth(5),
              bottom: context.getWidth(
                30,
              ),
              right: context.getWidth(
                5,
              ),
            ),
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: 1),
              duration: const Duration(
                seconds: 2,
              ),
              curve: Curves.easeOut,
              builder: (context, value, child) {
                return LayoutBuilder(
                  builder: (context, constraints) {
                    return CustomPaint(
                      painter: DrawBars(
                      homePageViewmodel:   homePageViewmodel,
                        selected_key:selected_key,
                        data: selected_key == 0
                            ? homePageViewmodel
                                  .getData1()
                            : homePageViewmodel
                                  .getData2(),


                      ),


                      size: Size(
                        constraints.maxWidth,
                        237,
                      ),

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
