import 'package:DummyInvoice/data/helpers/assets.dart';
import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/widgets/home_page_menu_widgets_navigation.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/data/notifiers.dart';
import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:DummyInvoice/widgets/custom_icon_widget.dart';
import 'package:DummyInvoice/widgets/drafts_widget.dart';
import 'package:DummyInvoice/widgets/recent_invoices_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState extends State<HomePage> {
Constants constants=Constants();

  @override
  Widget build(BuildContext context) {
    final  HomePageViewmodel viewmodel=HomePageViewmodel(
        context: context,constant: constants);


    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        centerTitle: false,
        titleSpacing: 0,
        backgroundColor: Theme.of(context).
        getBackColor(),
        title: Text(
          constants.homePageAppBarTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).
            getTextColor(),
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: CustomIconWidget(
            iconaddress:
            Assets.menuButtonAddress,
            height: 24,
            weight: 24,
            color: Theme.of(context)
                .getTextColor(),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CustomIconWidget(
              iconaddress: Theme.of(context)
                  .getNotificationIcon(),
              height: 24,
              weight: 24,
            ),
          ),
        ],
      ),

      body: SafeArea(
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
                        color: Theme.of(context)
                            .getContainerColor(
                            ),
                        borderRadius:
                            BorderRadius.all(
                              Radius.circular(28),
                            ),
                      ),
                      child: Column(
                        spacing: context
                            .getWidth(10),
                        mainAxisAlignment:
                            MainAxisAlignment
                                .start,
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
                                  return
                                    HomePageMenuWidgetsNavigation(
                                      constants: constants,);
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
                                  return viewmodel.widgets
                                      .elementAt(
                                        selected_widget,
                                      );
                                },
                          ),
                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                      children: [
                        Text(
                          constants
                              .recentInvoicesLabel,
                          style: TextStyle(
                            fontWeight:
                                FontWeight.bold,
                            fontSize: 24,
                            color: Theme.of(context)
                                .getTextColor(),
                          ),
                        ),

                        ElevatedButton.icon(
                          onPressed: () {},
                          iconAlignment:
                              IconAlignment.end,
                          style: ElevatedButton.styleFrom(
                            padding:
                                EdgeInsets.only(
                                  left: 10,
                                  right: 0,
                                ),
                            backgroundColor:
                                Colors
                                    .transparent,
                            shadowColor: Colors
                                .transparent,
                          ),
                          label: Text(
                            constants.viewAllLabel,
                            style: TextStyle(
                              color: Color(
                                0xff4F94FB,
                              ),
                              fontSize: 16,
                            ),
                          ),
                          icon: Icon(
                            Icons
                                .arrow_forward_ios_rounded,
                            size: 20,
                            color: Color(
                              0xff4F94FB,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(
                            horizontal: context
                                .getWidth(20),
                            vertical: context
                                .getWidth(8),
                          ),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .getBottomContainerColor(),
                        borderRadius:
                            BorderRadius.all(
                              Radius.circular(30),
                            ),
                      ),
                      child:
                          RecentInvoicesWidget(constant: constants,),
                    ),
                    Text(
                      constants.draftsLabel,
                      style: TextStyle(
                        fontWeight:
                            FontWeight.bold,
                        fontSize: 24,
                        color: Theme.of(context)
                            .getTextColor(),
                      ),
                    ),

                    Container(
                      padding:
                          EdgeInsets.symmetric(
                            horizontal: context
                                .getWidth(20),
                            vertical: context
                                .getWidth(8),
                          ),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .getBottomContainerColor(),
                        borderRadius:
                            BorderRadius.all(
                              Radius.circular(30),
                            ),
                      ),
                      child: DraftsWidget(constants: constants,),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
