import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/data/languages/language_manager.dart';
import 'package:DummyInvoice/pages/home_page/viewmodel/home_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecentInvoicesWidget
    extends StatefulWidget {
  const RecentInvoicesWidget({super.key,
    required this.constant

  });
  final Constants constant;
  @override
  State<RecentInvoicesWidget> createState() =>
      _RecentInvoicesWidgetState();
}

class _RecentInvoicesWidgetState
    extends State<RecentInvoicesWidget> {
  @override
  Widget build(BuildContext context) {
    final homePageViewmodel =context.watch<HomePageViewmodel>();


    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              Text(
                homePageViewmodel
                    .recentInvoiceName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Theme.of(context)
                      .getTextColor(),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  minimumSize: Size(50, 19),
                  shadowColor: Colors.transparent,
                  side: BorderSide(
                    color: Color(0xffF26666),
                    width: 1,
                  ),
                  backgroundColor: Color(
                    0xffF26666,
                  ).withValues(alpha: 0.2),
                ),
                child: Text(
                  homePageViewmodel
                      .recentInvoiceStatus,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              Text(
                homePageViewmodel
                    .recentInvoiceReceiptId,
                style: TextStyle(
                  color: Theme.of(context)
                      .getTextColor(),
                ),
              ),
              Row(
                children: [
                  Text(
                    LanguageManager.translate('issuedate'),
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xffBEC0CC),
                    ),
                  ),
                  Text(
                    ': ${homePageViewmodel.recentInvoiceIssueDate}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xffBEC0CC),
                    ),
                  ),
                ],
              ),
              Container(
                width: 1,
                height: 20,
                color: Color(
                  0xff000000,
                ).withValues(alpha: 0.1),
              ),
              Row(
                children: [
                  Text(
                    LanguageManager.translate('Due'),
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xffBEC0CC),
                    ),
                  ),
                  Text(
                   ': ${homePageViewmodel.recentInvoiceDueDate}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xffBEC0CC),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            color: Color(
              0xff000000,
            ).withValues(alpha: 0.1),
            thickness: 1,
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    LanguageManager.translate('Total'),
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context)
                          .getTextColor(),
                    ),
                  ),
                  Text(
                    LanguageManager.translate('Paid'),
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context)
                          .getTextColor(),
                    ),
                  ),
                ],
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        LanguageManager.translate('PKR'),
                        style: TextStyle(
                          color: Color(0xff3AC4FF),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                       ' ${homePageViewmodel.recentInvoiceTotalAmount}',
                        style: TextStyle(
                          color: Color(0xff3AC4FF),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        LanguageManager.translate('PKR'),
                        style: TextStyle(
                          color: Color(0xffFFAE00),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        ' ${homePageViewmodel.recentInvoicePaidAmount}',
                        style: TextStyle(
                          color: Color(0xffFFAE00),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.end,
                  children: [
                    Text(
                      LanguageManager.translate('DueAmount'),
                      style: TextStyle(
                        color: Theme.of(context)
                            .getTextColor(),
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          LanguageManager.translate('PKR'),
                          style: TextStyle(
                            color: Color(0xffF26666),
                            fontWeight:
                                FontWeight.bold,
                            fontSize: 17.0,
                          ),
                        ),
                        Text(
                          ' ${homePageViewmodel.recentInvoiceDueAmount}',
                          style: TextStyle(
                            color: Color(0xffF26666),
                            fontWeight:
                            FontWeight.bold,
                            fontSize: 17.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
