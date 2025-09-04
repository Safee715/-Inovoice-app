import 'package:DummyInvoice/data/helpers/assets.dart';
import 'package:DummyInvoice/data/helpers/common_functions.dart';
import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/pages/home_page/widgets/home_page_menu_widgets_navigation.dart';
import 'package:DummyInvoice/pages/navigation_pages/view/sub_navigation_page.dart';
import 'package:DummyInvoice/pages/templates_page/view/abstract_template.dart';
import 'package:DummyInvoice/pages/templates_page/viewmodel/templates_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/data/notifiers.dart';
import 'package:DummyInvoice/pages/home_page/viewmodel/home_page_viewmodel.dart';
import 'package:DummyInvoice/widgets/custom_icon_widget.dart';
import 'package:DummyInvoice/pages/home_page/widgets/drafts_widget.dart';
import 'package:DummyInvoice/pages/home_page/widgets/recent_invoices_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Constants constants = Constants();
  CommonFunctions commonFunctions =
      CommonFunctions();
  TemplatesPageViewmodel templatesPageViewmodel =
      TemplatesPageViewmodel();

  @override
  Widget build(BuildContext context) {

    return Consumer<HomePageViewmodel>(
      builder: (ctx, viewmodel, child) {

      return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          centerTitle: false,
          titleSpacing: 0,
          backgroundColor: Theme.of(
            context,
          ).getBackColor(),
          title: Text(
            constants.homePageAppBarTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(
                context,
              ).getTextColor(),
            ),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: CustomIconWidget(
              iconaddress: Assets.menuButtonAddress,
              height: 24,
              weight: 24,
              color: Theme.of(
                context,
              ).getTextColor(),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: CustomIconWidget(
                iconaddress: Theme.of(
                  context,
                ).getNotificationIcon(),
                height: 24,
                weight: 24,
              ),
            ),
          ],
        ),
      
        body: _buildHomePageBody(viewmodel),
      );
      },
    );
  }

  Widget _buildHomePageBody(
    HomePageViewmodel viewmodel,
  ) {
    return SafeArea(
      top: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                left: context.getWidth(15),
                right: context.getWidth(15),
                bottom: context.getWidth(15),
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 10,
                    ),
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).getContainerColor(),
                      borderRadius:
                          BorderRadius.all(
                            Radius.circular(28),
                          ),
                    ),
                    child: Column(
                      spacing: context.getWidth(
                        10,
                      ),
                      mainAxisAlignment:
                          MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: context
                              .getWidth(10),
                        ),
                        ValueListenableBuilder(
                          valueListenable:
                              selected_widget_notifier,
                          builder:
                              (
                                context,
                                selected_widget,
                                child,
                              ) {
                                return HomePageMenuWidgetsNavigation(
                                  constants:
                                      constants,
                                );
                              },
                        ),
                        ValueListenableBuilder(
                          valueListenable:
                              selected_widget_notifier,
                          builder:
                              (
                                context,
                                selected_widget,
                                child,
                              ) {
                                return viewmodel
                                    .widgets
                                    .elementAt(
                                      selected_widget,
                                    );
                              },
                        ),
                      ],
                    ),
                  ),
                  _buildRecentInvoiceWidget(),
                  _buildDraftsWidget(),
                  _buildTemplatesWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRecentInvoiceWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [
            Text(
              constants.recentInvoicesLabel,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Theme.of(
                  context,
                ).getTextColor(),
              ),
            ),

            ElevatedButton.icon(
              onPressed: () {},
              iconAlignment: IconAlignment.end,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 0,
                ),
                backgroundColor:
                    Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              label: Text(
                constants.viewAllLabel,
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
            horizontal: context.getWidth(20),
            vertical: context.getWidth(8),
          ),
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).getBottomContainerColor(),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: RecentInvoicesWidget(
            constant: constants,
          ),
        ),
      ],
    );
  }

  Widget _buildDraftsWidget() {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        Text(
          constants.draftsLabel,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Theme.of(
              context,
            ).getTextColor(),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.getWidth(20),
            vertical: context.getWidth(8),
          ),
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).getBottomContainerColor(),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: DraftsWidget(
            constants: constants,
          ),
        ),
      ],
    );
  }

  Widget _buildTemplatesWidget() {
    return GestureDetector(
      onTap: (){
        client_page_index.value=0;
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              SubNavigationPage(),
        ),
      );
    },
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceAround,
              children: [
                RectangularTemplate(
                  id: templatesPageViewmodel.ids
                      .elementAt(0),
                  name: templatesPageViewmodel
                      .names
                      .elementAt(0),
                  amount: templatesPageViewmodel
                      .amounts
                      .elementAt(0),
                  boxcolor: Colors.white,
                  textcolor: Colors.black,
                ),
                RectangularTemplate(
                  id: templatesPageViewmodel.ids
                      .elementAt(0),
                  name: templatesPageViewmodel
                      .names
                      .elementAt(0),
                  amount: templatesPageViewmodel
                      .amounts
                      .elementAt(0),
                  boxcolor: Colors.grey,
                  textcolor: Colors.black,
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceAround,
              children: [
                DesignedTemplate(
                  id: templatesPageViewmodel.ids
                      .elementAt(2),
                  name: templatesPageViewmodel
                      .names
                      .elementAt(2),
                  amount: templatesPageViewmodel
                      .amounts
                      .elementAt(2),
                  boxcolor: Colors.white,
                  textcolor: Colors.black,
                ),
                DesignedTemplate(
                  id: templatesPageViewmodel.ids
                      .elementAt(3),
                  name: templatesPageViewmodel
                      .names
                      .elementAt(3),
                  amount: templatesPageViewmodel
                      .amounts
                      .elementAt(3),
                  boxcolor: Colors.grey,
                  textcolor: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
