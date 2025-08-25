import 'package:DummyInvoice/data/helpers/assets.dart';
import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/widgets/data_container_widget.dart';

class DataWidget extends StatefulWidget {
  const DataWidget({super.key,required this.constants});

  final Constants constants;

  @override
  State<DataWidget> createState() =>
      _DataWidgetState();
}

class _DataWidgetState extends State<DataWidget> {
  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: EdgeInsets.only(
        left: context.getWidth(10),
        right: context.getWidth(10),
        bottom: context.getWidth(10),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                child: DataContainerWidget(
                  icon:Assets.TotalAmounts,

                  text: widget.constants.TotalAmountsText,
                  amount: '4,875 PKR',
                  color1: Color(
                    0xFF3AC4FF,
                  ).withValues(alpha: 0.1),
                  color2: Color(0xFF3AC4FF),
                ),
              ),

              SizedBox(
                child: DataContainerWidget(
                  icon:
                  Assets.TotalPaid,
                  text: widget.constants.TotalPaidText,
                  amount: '4,875 PKR',
                  color1: Color(
                    0xFF6690FF,
                  ).withValues(alpha: 0.1),
                  color2: Color(0xFF668FFF),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                child: DataContainerWidget(
                  icon:
                  Assets.TotalDue,
                  text: widget.constants.TotalDueText,
                  amount: '4,875 PKR',
                  color1: Color(
                    0xffFF99591A,
                  ).withValues(alpha: 0.1),
                  color2: Color(0xffFF9959),
                ),
              ),

              SizedBox(
                child: DataContainerWidget(
                  icon:
                  Assets.TotalClients,
                  text: widget.constants.TotalClientsText,
                  amount: '15',
                  color1: Color(
                    0xff7778E5,
                  ).withValues(alpha: 0.1),
                  color2: Color(0xff7778E5),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                child: DataContainerWidget(
                  icon:
                  Assets.TotalItems,
                  text: widget.constants.TotalItemsText,
                  amount: '10',
                  color1: Color(
                    0xff73BCE5,
                  ).withValues(alpha: 0.1),
                  color2: Color(0xff73BCE5),
                ),
              ),

              SizedBox(
                child: DataContainerWidget(
                  icon:
                  Assets.TotalInvoice,
                  text: widget.constants.TotalInvoiceText,
                  amount: '50',
                  color1: Color(
                    0xff3BBB2D,
                  ).withValues(alpha: 0.1),
                  color2: Color(0xff3BBB2D),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                child: DataContainerWidget(
                  icon:
                  Assets.PaidInvoice,
                  text: widget.constants.PaidInvoiceText,
                  amount: '12',
                  color1: Color(
                    0xffFFAE00,
                  ).withValues(alpha: 0.1),
                  color2: Color(0xffFFAE00),
                ),
              ),

              SizedBox(
                child: DataContainerWidget(
                  icon:
                  Assets.DueInvoice,
                  text: widget.constants.DueInvoiceText,
                  amount: '52',
                  color1: Color(
                    0xffF26666,
                  ).withValues(alpha: 0.1),
                  color2: Color(0xffF26666),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
