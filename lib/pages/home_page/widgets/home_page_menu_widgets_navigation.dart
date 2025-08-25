import 'package:DummyInvoice/data/helpers/assets.dart';
import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/pages/home_page/viewmodel/home_page_viewmodel.dart';

import 'package:DummyInvoice/pages/home_page/widgets/custom_cuppertino_button.dart';

class HomePageMenuWidgetsNavigation
    extends StatefulWidget {
  const HomePageMenuWidgetsNavigation({
    super.key,
    required this.constants
  });
final Constants constants;
  @override
  State<HomePageMenuWidgetsNavigation>
  createState() =>
      _HomePageMenuWidgetsNavigationState();
}

class _HomePageMenuWidgetsNavigationState
    extends State<HomePageMenuWidgetsNavigation> {


  @override
  Widget build(BuildContext context) {
    HomePageViewmodel homePageViewmodel=
    HomePageViewmodel(constant:widget.constants ,
        context: context);
    return Row(
      spacing: context.getWidth(5),
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomCuppertinoButton(
          iconAddress:
              Assets.homePageDetailsAddress,
          onPressed: () {
            homePageViewmodel.setHomePageDetails();
          },
          index: 0,
        ),
        CustomCuppertinoButton(
          iconAddress: Assets.BarChartAddress,
          onPressed: () {
            homePageViewmodel.setBarChartDetails();
          },
          index: 1,
        ),
        CustomCuppertinoButton(
          iconAddress: Assets.PieChartAddress,
          onPressed: () {
            homePageViewmodel.setPieChartDetails();
          },
          index: 2,
        ),
        SizedBox(width: context.getWidth(15)),
      ],
    );
  }
}
