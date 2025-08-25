import 'package:DummyInvoice/pages/items_page/viewmodel/items_page_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class ViewItemsDetailsViewmodel {
  ViewItemsDetailsViewmodel({required this.id});
  final id;
  final TextEditingController itemNameController =
      TextEditingController();
  final TextEditingController
  itemPriceController = TextEditingController();
  final TextEditingController itemCodeController =
      TextEditingController();
  final TextEditingController
  itemQuantityController =
      TextEditingController();
  final TextEditingController
  itemCategoryController =
      TextEditingController();
  final TextEditingController itemUnitController =
      TextEditingController();

  void getControllerText(
    ItemsPageViewmodel itemsPageViewmodel,
  ) {
    final item = itemsPageViewmodel.items.value
        .firstWhere(
          (element) => element.id == id,
        );
    itemNameController.text = item.itemName;
    itemPriceController.text = item.itemPrice
        .toString();
    itemCodeController.text = item.itemCode
        .toString();
    itemQuantityController.text = item
        .itemQuantity
        .toString();
    itemCategoryController.text =
        item.itemCategory;
    itemUnitController.text = item.itemUnit;
  }
}
