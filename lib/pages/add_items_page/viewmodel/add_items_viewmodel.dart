import 'package:flutter/foundation.dart';

class AddItemViewmodel extends ChangeNotifier {
  final appBarTitle = 'Add Item';
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
}

class Item {
  Item({
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  final firstName;
  final lastName;
  final email;
  String getFullName() => '$firstName $lastName';
}
