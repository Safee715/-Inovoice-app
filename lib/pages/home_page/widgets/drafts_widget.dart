import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/data/languages/language_manager.dart';
import 'package:DummyInvoice/pages/home_page/viewmodel/home_page_viewmodel.dart';
import 'package:flutter/material.dart';

class DraftsWidget extends StatefulWidget {
  const DraftsWidget({super.key,required this.constants});
final Constants constants;
  @override
  State<DraftsWidget> createState() =>
      _DraftsWidgetState();
}

class _DraftsWidgetState
    extends State<DraftsWidget> {

  @override
  Widget build(BuildContext context) {
    HomePageViewmodel homePageViewmodel=
    HomePageViewmodel(constant: widget.constants,context: context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              Text(
                 homePageViewmodel.draftName,
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
                  side: BorderSide(
                    width: 1,
                    color: Color(0xffC8CBD1),
                  ),
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.only(
                    right: 10,
                    left: 10,
                  ),
                  minimumSize: Size(50, 19),
                  backgroundColor: Color(
                    0xffD6DAE0,
                  ),
                ),
                child: Text(
                  homePageViewmodel.draftStatus,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff303744),
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
                homePageViewmodel.draftReceiptId,
                style: TextStyle(
                  color:  Theme.of(context)
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
                    ': ${homePageViewmodel.draftIssueDate}',
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
                    '${homePageViewmodel.draftDueDate}',
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
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LanguageManager.translate('Total'),
                    style: TextStyle(
                      fontSize: 12,
                      color:  Theme.of(context)
                          .getTextColor(),
                    ),
                  ),
                  Text(
                    LanguageManager.translate('Paid'),
                    style: TextStyle(
                      fontSize: 12,
                      color:  Theme.of(context)
                          .getTextColor(),
                    ),
                  ),
                ],
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                        ' ${homePageViewmodel.draftTotalAmount}',
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
                        ' ${homePageViewmodel.draftPaidAmount}',
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
                        color:  Theme.of(context)
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
                          ' ${homePageViewmodel.draftDueAmount}',
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
