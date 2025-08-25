import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/pages/edit_items_page/edit_items_page.dart';
import 'package:DummyInvoice/pages/items_page/items_page_viewmodel.dart';
import 'package:DummyInvoice/pages/itemsdetails/view_item_details.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/widgets/custom_icon_widget.dart';

class ItemsMenuWidget extends StatefulWidget {
  const ItemsMenuWidget({
    super.key,
    required this.id,
    required this.itemsPageViewmodel,
  });
  final int id;
  final ItemsPageViewmodel itemsPageViewmodel;
  @override
  State<ItemsMenuWidget> createState() =>
      _ItemsMenuWidgetState();
}

class _ItemsMenuWidgetState
    extends State<ItemsMenuWidget> {
  @override
  Widget build(BuildContext context) {


    return PopupMenuButton(
      onSelected: (value) {
        print('value is $value');
        if (value == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return EditItemsPage(
                  id: widget.id,
                );
              },
            ),
          );
        } else if (value == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ViewItemsDetails(
                  id: widget.id,
                );
              },
            ),
          );
        } else if (value == 2) {
          return widget.itemsPageViewmodel
              .deleteItem(widget.id);
        }
      },

      color: Theme.of(context)
          .getBottomContainerColor()
          .withValues(alpha: 0.8),
      icon: CustomIconWidget(
        iconaddress: Theme.of(context).getMenuIcon(),
        height: 24,
        weight: 24,
      ),

      itemBuilder: (context) => [
        PopupMenuItem(
          child: ListTile(
            leading: CustomIconWidget(
              iconaddress:
                  'assets/images/icons/Group 37201.svg',
              height: 18,
              weight: 18,
              color: Theme.of(context)
                  .getTextColor(),
            ),
            title: Text('Edit'),
          ),
          value: 0,
        ),
        PopupMenuItem(
          child: ListTile(
            leading: CustomIconWidget(
              iconaddress:
                  'assets/images/icons/eye.svg',
              height: 18,
              weight: 18,
              color: Theme.of(context)
                  .getTextColor(),
            ),
            title: Text('View Details'),
          ),
          value: 1,
        ),
        PopupMenuItem(
          child: ListTile(
            leading: CustomIconWidget(
              iconaddress:
                  'assets/images/icons/trash.svg',
              height: 18,
              weight: 18,
              color: Theme.of(context)
                  .getTextColor(),
            ),
            title: Text('Delete'),
          ),
          value: 2,
        ),
      ],
    );
  }
}
