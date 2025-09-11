import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/pages/home_page/widgets/drafts_widget.dart';
import 'package:DummyInvoice/data/helpers/constants.dart';

class BuildDraftsWidget extends StatelessWidget {

  const BuildDraftsWidget({super.key});
  @override
  Widget build(BuildContext context) {
    Constants constants = Constants();

    return Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Text(
            constants.draftsLabel,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Theme.of(
                context,
              ).getTextColor(),
            ),
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
            child: DraftsWidget(
              constants: constants,
            ),
          ),
        ],
      );


  }
}
