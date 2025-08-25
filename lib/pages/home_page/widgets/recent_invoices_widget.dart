import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/pages/home_page/viewmodel/home_page_viewmodel.dart';
import 'package:flutter/material.dart';

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
    HomePageViewmodel homePageViewmodel =
        HomePageViewmodel(constant: widget.constant,context: context);


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
              Text(
                'Issue: ${homePageViewmodel.recentInvoiceIssueDate}',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xffBEC0CC),
                ),
              ),
              Container(
                width: 1,
                height: 20,
                color: Color(
                  0xff000000,
                ).withValues(alpha: 0.1),
              ),
              Text(
                'Due: ${homePageViewmodel.recentInvoiceDueDate}',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xffBEC0CC),
                ),
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
                    'Total: ',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context)
                          .getTextColor(),
                    ),
                  ),
                  Text(
                    'Paid: ',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context)
                          .getTextColor(),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'PKR ${homePageViewmodel.recentInvoiceTotalAmount}',
                    style: TextStyle(
                      color: Color(0xff3AC4FF),
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    'PKR ${homePageViewmodel.recentInvoicePaidAmount}',
                    style: TextStyle(
                      color: Color(0xffFFAE00),
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Due Amount',
                      style: TextStyle(
                        color: Theme.of(context)
                            .getTextColor(),
                      ),
                    ),
                    Text(
                      'PKR ${homePageViewmodel.recentInvoiceDueAmount}',
                      style: TextStyle(
                        color: Color(0xffF26666),
                        fontWeight:
                            FontWeight.bold,
                        fontSize: 17.0,
                      ),
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
