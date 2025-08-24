import 'package:flutter/material.dart';
import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';

import 'package:DummyInvoice/widgets/custom_cuppertino_button.dart';

class HomePageMenuWidgetsNavigation extends StatefulWidget {
  const HomePageMenuWidgetsNavigation({super.key});

  @override
  State<HomePageMenuWidgetsNavigation> createState() => _HomePageMenuWidgetsNavigationState();
}

class _HomePageMenuWidgetsNavigationState extends State<HomePageMenuWidgetsNavigation> {
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
    return Row(
      spacing: viewmodel.getWidth(5),
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomCuppertinoButton(
          iconAddress:
          viewmodel.homePageDetailsAddress,
          onPressed: () {
            viewmodel.setHomePageDetails();
          },
          index: 0,
        ),
        CustomCuppertinoButton(
          iconAddress: viewmodel.BarChartAddress,
          onPressed: () {
            viewmodel.setBarChartDetails();
          },
          index: 1,
        ),
        CustomCuppertinoButton(
          iconAddress: viewmodel.PieChartAddress,
          onPressed: () {
            viewmodel.setPieChartDetails();
          },
          index: 2,
        ),
        SizedBox(width: viewmodel.getWidth(15)),
      ],
    );
  }
}
