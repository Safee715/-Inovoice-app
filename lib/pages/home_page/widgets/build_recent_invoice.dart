import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/pages/home_page/widgets/recent_invoices_widget.dart';
import 'package:DummyInvoice/data/helpers/constants.dart';

class BuildRecentInvoice extends StatelessWidget {
  const BuildRecentInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    Constants constants = Constants();


  return
     Column(
        children: [
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Text(
                constants.recentInvoicesLabel,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Theme.of(
                    context,
                  ).getTextColor(),
                ),
              ),

              ElevatedButton.icon(
                onPressed: () {},
                iconAlignment: IconAlignment.end,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 0,
                  ),
                  backgroundColor:
                  Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                label: Text(
                  constants.viewAllLabel,
                  style: const TextStyle(
                    color: Color(0xff4F94FB),
                    fontSize: 16,
                  ),
                ),
                icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20,
                  color: Color(0xff4F94FB),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: context.getWidth(20),
              vertical: context.getWidth(8),
            ),
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).getBottomContainerColor(),
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: RecentInvoicesWidget(
              constant: constants,
            ),
          ),
        ],
      );

  }
}
