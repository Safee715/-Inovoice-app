import 'package:flutter/material.dart';
// import 'package:invoiceapp/widgets/custom_icon_widget.dart';
import 'package:invoiceapp/widgets/data_container_widget.dart';

class DataWidget extends StatefulWidget {
  const DataWidget({super.key});

  @override
  State<DataWidget> createState() => _DataWidgetState();
}

class _DataWidgetState extends State<DataWidget> {
  @override
  Widget build(BuildContext context) {
double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight =MediaQuery.of(context).size.height;

print(MediaQuery.of(context).size.width);
print(MediaQuery.of(context).size.height);


      return Padding(
        padding:  EdgeInsets.only(left: screenWidth*0.048,
            right:screenWidth*0.048,bottom: screenWidth*0.048 ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: DataContainerWidget(
                    icon: 'assets/images/icons/total amounts.svg',
                    text: 'Total Amounts',
                    amount: '4328PKR',
                    color1: Color(0xFF3AC4FF).withValues(alpha: 0.1),
                    color2: Color(0xFF3AC4FF),),
                ),

                SizedBox(
                  child: DataContainerWidget(
                    icon: 'assets/images/icons/total paid.svg',
                    text: 'Total Paid',
                    amount: '4328PKR',
                    color1: Color(0xFF6690FF).withValues(alpha: 0.1),
                    color2: Color(0xFF668FFF),),
                ),

              ],
            ),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: DataContainerWidget(
                    icon: 'assets/images/icons/total due.svg',
                    text: 'Total Due',
                    amount: '4328PKR',
                    color1: Color(0xffFF99591A).withValues(alpha: 0.1),
                    color2: Color(0xffFF9959),),
                ),

                SizedBox(
                  child: DataContainerWidget(
                    icon: 'assets/images/icons/clients.svg',
                    text: 'Total Clients',
                    amount: '4328PKR',
                    color1: Color(0xff7778E5).withValues(alpha: 0.1),
                    color2: Color(0xff7778E5),),
                ),

              ],
            ),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: DataContainerWidget(
                    icon: 'assets/images/icons/items.svg',
                    text: 'Total Items',
                    amount: '10',
                    color1: Color(0xff73BCE5).withValues(alpha: 0.1),
                    color2: Color(0xff73BCE5),),
                ),

                SizedBox(
                  child: DataContainerWidget(
                    icon: 'assets/images/icons/total invoices.svg',
                    text: 'Total Invoices',
                    amount: '50',
                    color1: Color(0xff3BBB2D).withValues(alpha: 0.1),
                    color2: Color(0xff3BBB2D),),
                ),

              ],
            ),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: DataContainerWidget(
                    icon: 'assets/images/icons/paid invoices.svg',
                    text: 'Paid Invoices',
                    amount: '12',
                    color1: Color(0xffFFAE00).withValues(alpha: 0.1),
                    color2: Color(0xffFFAE00),),
                ),

                SizedBox(
                  child: DataContainerWidget(
                    icon: 'assets/images/icons/due invoices.svg',
                    text: 'Due Invoices',
                    amount: '52',
                    color1: Color(0xffF26666).withValues(alpha: 0.1),
                    color2: Color(0xffF26666),),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      );



  }
}
