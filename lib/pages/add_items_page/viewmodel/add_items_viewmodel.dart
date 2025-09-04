import 'package:DummyInvoice/data/languages/language_manager.dart';
import 'package:flutter/foundation.dart';

class AddItemViewmodel extends ChangeNotifier {
  final addItemAppBarTitle = LanguageManager.translate('addItemAppBarTitle');
  final itemNameLabel = LanguageManager.translate('itemNameLabel');
  final itemPriceLabel = LanguageManager.translate('itemPriceLabel');
  final itemQuantityLabel = LanguageManager.translate('itemQuantityLabel');
  final itemCodeLabel = LanguageManager.translate('itemCodeLabel');
  final itemCategoryLabel = LanguageManager.translate('itemCategoryLabel');
  final itemUnitLabel = LanguageManager.translate('itemUnitLabel');
  final itemName = LanguageManager.translate('itemName');
  final itemPrice = LanguageManager.translate('itemPrice');
  final itemCode = LanguageManager.translate('itemCode');
  final itemQuantity = LanguageManager.translate('itemQuantity');
  final itemCategory = LanguageManager.translate('itemCategory');
  final itemUnit = LanguageManager.translate('itemUnit');
  final addButtonText = LanguageManager.translate('addButtonText');
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
