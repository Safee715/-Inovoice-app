import 'package:DummyInvoice/pages/items_page/items_page_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class EditItemViewmodel {
  EditItemViewmodel({required this.id});
  final appBarTitle = 'Edit Item';
  final itemNameLabel = 'Item Name';
  final itemPriceLabel = 'Item Price';
  final itemQuantityLabel = 'Item Quantity';
  final itemCodeLabel = 'Item Code';
  final itemCategoryLabel = 'Item Category';
  final itemUnitLabel = 'Item Unit';
  final itemName = 'Enter Item Name';
  final itemPrice = 'Enter Item Price';
  final itemCode = 'Enter Item Code';
  final itemQuantity = 'Enter Item Quantity';
  final itemCategory = 'Enter Item Category';
  final itemUnit = 'Enter Item Unit';
  final addButtonText = 'Add Item';

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
