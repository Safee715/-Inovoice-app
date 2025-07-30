import 'package:flutter/material.dart';
import 'package:invoiceapp/widgets/custom_icon_widget.dart';


class DetailsDataWidget extends StatefulWidget {
  const DetailsDataWidget({super.key});

  @override
  State<DetailsDataWidget> createState() => _DetailsDataWidgetState();
}

class _DetailsDataWidgetState extends State<DetailsDataWidget> {
  @override
  Widget build(BuildContext context) {
    return
      Flexible(
        child: GridView.extent(
maxCrossAxisExtent: 157,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.5,
          padding: EdgeInsetsGeometry.directional(),
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xFF3AC4FF).withValues(alpha: 0.1),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Total Amounts',
                      style: TextStyle(
                        fontSize: 12,
                       fontFamily:'Biennale',fontWeight: FontWeight.w500,
                        color: Color(0xFF3AC4FF),
                      ),
                    ),
                    leading:
                      CustomIconWidget(
                          iconaddress: 'assets/images/icons/total amounts.svg',
                          height: 24, weight: 24,
                          color: Color(0xFF3AC4FF),
                      ),
                  ),

                  Text(
                    '4328PKR',
                    style: TextStyle(fontFamily: 'Biennale',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,fontSize: 16,),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color(0xFF6690FF).withValues(alpha: 0.1),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Total Paid',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color:Color(0xFF668FF).withValues(alpha: 100),
                      ),
                    ),
                    leading: CustomIconWidget(
                        iconaddress: 'assets/images/icons/total paid.svg',
                        height: 24, weight: 24,
                        color: Color(0xFF668FF).withValues(alpha: 100),)
                  ),
                  Text(
                    '4328PKR',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,fontSize: 16,),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color(0xffFF99591A).withValues(alpha: 0.1),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Total Due',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffFF9959),
                      ),
                    ),
                    leading: CustomIconWidget(iconaddress: 'assets/images/icons/total due.svg',
                        height: 24, weight: 24,
                        color: Color(0xffFF9959),)
                  ),
                  Text(
                    '4328PKR',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,fontSize: 16,),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color(0xff7778E5).withValues(alpha: 0.1),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Total Clients',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff7778E5),
                      ),
                    ),
                    leading:CustomIconWidget(iconaddress: 'assets/images/icons/clients.svg',
                        height: 24, weight: 24,
                        color: Color(0xff7778E5).withValues(alpha: 1),)
                  ),
                  Text(
                    '15',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,fontSize: 16,),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color(0xff73BCE5).withValues(alpha: 0.1),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Total Items',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff73BCE5),
                      ),
                    ),
                    leading: CustomIconWidget(iconaddress: 'assets/images/icons/items.svg',
                        height: 24, weight:24, color: Color(0xff73BCE5))
                  ),
                  Text(
                    '10',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,fontSize: 16,),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color(0xff3BBB2D).withValues(alpha: 0.1),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Total Invoices',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff3BBB2D),
                      ),
                    ),
                    leading: CustomIconWidget(iconaddress: 'assets/images/icons/total invoices.svg',
                        height:24, weight: 24, color:Color(0xff3BBB2D)),
                  ),
                  Text(
                    '50',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,fontSize: 16,),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color(0xffFFAE00).withValues(alpha: 0.1),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Paid Invoices',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color:Color(0xffFFAE00),),
                    ),
                    leading:CustomIconWidget(iconaddress: 'assets/images/icons/paid invoices.svg',
                        height:24, weight:24, color:Color(0xffFFAE00),
                    ),
                  ),
                  Text(
                    '24',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:Colors.black,fontSize: 16,),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color(0xffF26666).withValues(alpha: 0.1),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Due Invoices',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffF26666),
                      ),
                    ),
                    leading: CustomIconWidget(iconaddress: 'assets/images/icons/due invoices.svg',
                        height: 24, weight: 24, color: Color(0xffF26666)
                    ),
                  ),
                  Text(
                    '52',
                    style: TextStyle(fontWeight: FontWeight.bold,
                      color: Colors.black,fontSize: 16,),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  }
}
