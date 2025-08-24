import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/widgets/data_container_widget.dart';

class DataWidget extends StatefulWidget {
  const DataWidget({super.key});

  @override
  State<DataWidget> createState() => _DataWidgetState();
}

class _DataWidgetState extends State<DataWidget> {
  @override
  Widget build(BuildContext context) {


HomePageViewmodel homePageViewmodel=HomePageViewmodel(
  screenWidth: MediaQuery.of(context).size.width,
  screenHeight: MediaQuery.of(context).size.height,

);


      return Padding(
        padding:  EdgeInsets.only(
            left: homePageViewmodel.getWidth( 10),
            right:homePageViewmodel.getWidth( 10),
            bottom: homePageViewmodel.getWidth( 10),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  child: DataContainerWidget(
                    icon: 'assets/images/icons/total amounts.svg',
                    text: 'Total Amounts',
                    amount: '4,875 PKR',
                    color1: Color(0xFF3AC4FF).withValues(alpha: 0.1),
                    color2: Color(0xFF3AC4FF),),
                ),

                SizedBox(
                  child: DataContainerWidget(
                    icon: 'assets/images/icons/total paid.svg',
                    text: 'Total Paid',
                    amount: '4,875 PKR',
                    color1: Color(0xFF6690FF).withValues(alpha: 0.1),
                    color2: Color(0xFF668FFF),),
                ),

              ],
            ),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  child: DataContainerWidget(
                    icon: 'assets/images/icons/total due.svg',
                    text: 'Total Due',
                    amount: '4,875 PKR',
                    color1: Color(0xffFF99591A).withValues(alpha: 0.1),
                    color2: Color(0xffFF9959),),
                ),

                SizedBox(
                  child: DataContainerWidget(
                    icon: 'assets/images/icons/clients.svg',
                    text: 'Total Clients',
                    amount: '15',
                    color1: Color(0xff7778E5).withValues(alpha: 0.1),
                    color2: Color(0xff7778E5),),
                ),

              ],
            ),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    text: 'Total Invoice',
                    amount: '50',
                    color1: Color(0xff3BBB2D).withValues(alpha: 0.1),
                    color2: Color(0xff3BBB2D),),
                ),

              ],
            ),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  child: DataContainerWidget(
                    icon: 'assets/images/icons/paid invoices.svg',
                    text: 'Paid Invoice',
                    amount: '12',
                    color1: Color(0xffFFAE00).withValues(alpha: 0.1),
                    color2: Color(0xffFFAE00),),
                ),

                SizedBox(
                  child: DataContainerWidget(
                    icon: 'assets/images/icons/due invoices.svg',
                    text: 'Due Invoice',
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
