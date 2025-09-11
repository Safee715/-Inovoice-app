import 'package:DummyInvoice/data/helpers/assets.dart';
import 'package:DummyInvoice/data/helpers/common_functions.dart';
import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/pages/home_page/widgets/build_drafts_widget.dart';
import 'package:DummyInvoice/pages/home_page/widgets/build_recent_invoice.dart';
import 'package:DummyInvoice/pages/home_page/widgets/build_templates_widgets.dart';
import 'package:DummyInvoice/pages/home_page/widgets/home_page_menu_widgets_navigation.dart';
import 'package:DummyInvoice/pages/templates_page/viewmodel/templates_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/data/notifiers.dart';
import 'package:DummyInvoice/pages/home_page/viewmodel/home_page_viewmodel.dart';
import 'package:DummyInvoice/widgets/custom_icon_widget.dart';
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
print('safee');
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
            icon:  CustomIconWidget(
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
                    margin: const EdgeInsets.only(
                      top: 10,
                    ),
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).getContainerColor(),
                      borderRadius:
                          const BorderRadius.all(
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
                  const BuildRecentInvoice(),
                  const BuildDraftsWidget(),
                  const BuildTemplatesWidgets(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


}
