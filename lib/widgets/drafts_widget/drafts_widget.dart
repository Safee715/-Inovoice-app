import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/widgets/drafts_widget/drafts_viewmodel.dart';

class DraftsWidget extends StatefulWidget {
  const DraftsWidget({super.key});

  @override
  State<DraftsWidget> createState() => _DraftsWidgetState();
}

class _DraftsWidgetState extends State<DraftsWidget> {
  @override
  Widget build(BuildContext context) {
    DraftsViewmodel draftsViewmodel=DraftsViewmodel();
    HomePageViewmodel homePageViewmodel=HomePageViewmodel();
    bool isDark =Theme.of(context).brightness==Brightness.dark;

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(draftsViewmodel.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color:homePageViewmodel.getTextColor(isDark),
                ),
              ),
               ElevatedButton(onPressed: (){} ,
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 1,color: Color(0xffC8CBD1),

                    ),shadowColor: Colors.transparent,
                    padding:EdgeInsets.only(right: 10,left: 10),
                    minimumSize: Size(50, 19),
                    backgroundColor: Color(0xffD6DAE0),
                  ),
                  child: Text(draftsViewmodel.status,
                    style: TextStyle(fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff303744)),
                  ),
                ),

            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(draftsViewmodel.receiptId,
                style: TextStyle(
                  color:
                homePageViewmodel.getTextColor(isDark),
                ),

              ),

              Text('Issue: ${draftsViewmodel.issueDate}',
                style: TextStyle(fontSize: 12,color: Color(0xffBEC0CC),),),
              Container(width: 1,height: 20,
                color: Color(0xff000000).withValues(alpha: 0.1),),
              Text('Due: ${draftsViewmodel.dueDate}',
                style: TextStyle(fontSize: 12,color: Color(0xffBEC0CC),),),
            ],
          ),
          Divider(color: Color(0xff000000).withValues(alpha: 0.1),thickness: 1,),
          Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text('Total: ',style: TextStyle(fontSize: 12,
                      color: homePageViewmodel.getTextColor(isDark),),),
                  Text('Paid: ',style: TextStyle(fontSize: 12,
                      color: homePageViewmodel.getTextColor(isDark),),),
                ],
              ),
              Column(
                children: [
                  Text('PKR ${draftsViewmodel.totalAmount}',
                      style: TextStyle(
                          color: Color(0xff3AC4FF),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                  Text('PKR ${draftsViewmodel.paidAmount}',
                      style: TextStyle(
                          color: Color(0xffFFAE00),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                ],
              ),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Due Amount',
                      style: TextStyle(color:  homePageViewmodel.getTextColor(isDark),),),
                    Text('PKR ${draftsViewmodel.dueAmount}',
                      style: TextStyle(color: Color(0xffF26666),fontWeight: FontWeight.bold,
                          fontSize: 17.0
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
