import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/pages/items_page/viewmodel/items_page_viewmodel.dart';
import 'package:DummyInvoice/pages/items_page/Widgets/items_menu_widget.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({
    super.key,
    required this.name,
    required this.price,
    required this.id,
    required this.itemsPageViewmodel,
  });

  final String name;
  final double price;
  final int id;
  final ItemsPageViewmodel itemsPageViewmodel;
  @override
  State<ItemDetails> createState() =>
      _ItemDetailsState();
}

class _ItemDetailsState
    extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {

    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 8.0,
      ),
      minLeadingWidth: 30,
      horizontalTitleGap: 5,
      dense: true,
      tileColor: Theme.of(context)
          .getBottomContainerColor(),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadiusGeometry.circular(10),
        side: BorderSide(
          color: Theme.of(context)
              .getTextColor()
              .withValues(alpha: 0.2),
        ),
      ),

      title: Row(
        mainAxisAlignment:
            MainAxisAlignment.start,
        children: [
          SizedBox(width: 10),
          Text(
            widget.name,
            style: TextStyle(
              color: Theme.of(context)
                  .getTextColor(),
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          Spacer(),
          Text(
            "\$${widget.price.toString()}",
            style: TextStyle(
              color: Color(0xFF4082E3),
              fontSize: 12,
            ),
          ),
        ],
      ),
      trailing: ItemsMenuWidget(
        itemsPageViewmodel:
            widget.itemsPageViewmodel,
        id: widget.id,
      ),
    );
  }
}
