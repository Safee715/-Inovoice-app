import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/widgets/recent_invoices_widget/recent_invoices_viewmodel.dart';

class RecentInvoicesWidget extends StatefulWidget {
  const RecentInvoicesWidget({super.key});

  @override
  State<RecentInvoicesWidget> createState() => _RecentInvoicesWidgetState();
}

class _RecentInvoicesWidgetState extends State<RecentInvoicesWidget> {
  @override
  Widget build(BuildContext context) {
    HomePageViewmodel homePageViewmodel=HomePageViewmodel();
    RecentInvoicesViewmodel recentInvoicesViewmodel=RecentInvoicesViewmodel();
    bool isDark =Theme.of(context).brightness==Brightness.dark;

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(recentInvoicesViewmodel.name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color:homePageViewmodel.getTextColor(isDark),

            ),
          ),
             ElevatedButton(onPressed: (){} ,
                style:ElevatedButton.styleFrom(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  minimumSize: Size(50, 19),shadowColor: Colors.transparent,
                side: BorderSide(
                    color: Color(0xffF26666),width: 1),
                  backgroundColor: Color(0xffF26666).withValues(alpha: 0.2),),
                child: Text(recentInvoicesViewmodel.status,
                  style: TextStyle(color: Colors.red,fontWeight: FontWeight.w400,fontSize: 12),),
              ),

      ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(recentInvoicesViewmodel.receiptId ,
                style: TextStyle(
              color:
              homePageViewmodel.getTextColor(isDark),
    ),),
              Text('Issue: ${recentInvoicesViewmodel.issueDate}',
                style: TextStyle(fontSize: 12,color: Color(0xffBEC0CC),),
              ),
              Container(width: 1,height: 20,
                color: Color(0xff000000).withValues(alpha: 0.1),),
              Text('Due: ${recentInvoicesViewmodel.dueDate}',
                style: TextStyle(fontSize: 12,color: Color(0xffBEC0CC),),),
            ],
          ),
          Divider(color: Color(0xff000000).withValues(alpha: 0.1),thickness: 1,),
          Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text('Total: ',
                    style: TextStyle(fontSize: 12,
                      color:  homePageViewmodel.getTextColor(isDark),),),
                  Text('Paid: ',
                    style: TextStyle(fontSize: 12,
                      color:  homePageViewmodel.getTextColor(isDark),),),
                ],
              ),
              Column(
                children: [
                  Text('PKR ${recentInvoicesViewmodel.totalAmount}',
                      style: TextStyle(
                          color: Color(0xff3AC4FF),
                          fontWeight: FontWeight.bold,
                  fontSize: 16.0)),
                  Text('PKR ${recentInvoicesViewmodel.paidAmount}',
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
                    Text('PKR ${recentInvoicesViewmodel.dueAmount}',
                      style: TextStyle(
                          color: Color(0xffF26666),
                          fontWeight: FontWeight.bold,
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
