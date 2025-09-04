import 'package:DummyInvoice/data/notifiers.dart';
import 'package:DummyInvoice/main.dart';
import 'package:DummyInvoice/pages/items_page/model/item_page_model.dart';
import 'package:DummyInvoice/pages/items_page/repo/item_page_repository.dart';
import 'package:flutter/material.dart';

class ItemsPageViewmodel extends ChangeNotifier {
  ItemsPageViewmodel(this.repo);

  final ItemPageRepository repo;

  ValueNotifier<List<Item>> items = ValueNotifier(
    [],
  );

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

  Future<void> loadItems() async {
    await repo.openDb();
    items.value = await repo.getAllItems();
    notifyListeners();
  }

  void addItem() async {
    await repo.openDb();
    await repo.insertItem(
      Item(
        itemName: itemNameController.text,
        itemPrice: double.parse(
          itemPriceController.text,
        ),
        itemCode: double.parse(
          itemCodeController.text,
        ),
        itemQuantity: int.parse(
          itemQuantityController.text,
        ),
        itemCategory: itemCategoryController.text,
        itemUnit: itemUnitController.text,
      ),
    );
    notifyListeners();
  }

  void deleteItem(int id) async {
    await repo.openDb();
    await repo.deleteItem(id);
    notifyListeners();
  }

  void editItem(
    int id,
    String itemName,
    String itemPrice,
    String itemCode,
    String itemQuantity,
    String itemCategory,
    String itemUnit,
  ) async {
    await repo.openDb();
    await repo.upDateItem(
      Item(
        id: id,
        itemName: itemName,
        itemPrice: double.parse(itemPrice),
        itemCode: double.parse(itemCode),
        itemQuantity: int.parse(itemQuantity),
        itemCategory: itemCategory,
        itemUnit: itemUnit,
      ),
    );
    print('item name :$itemNameController.text');
    notifyListeners();
  }

  void clearControllers() {
    itemNameController.clear();
    itemPriceController.clear();
    itemCodeController.clear();
    itemQuantityController.clear();
    itemCategoryController.clear();
    itemUnitController.clear();
  }

  final addButtonAddress =
      'assets/images/icons/addclients.svg';

  void backButtonFunction() {
    selected_page_notifier.value = 0;
  }

  @override
  void dispose() {
    itemNameController.dispose();
    itemPriceController.dispose();
    itemCodeController.dispose();
    itemQuantityController.dispose();
    itemCategoryController.dispose();
    itemUnitController.dispose();
    super.dispose();
  }
  RegExp getRegExp()
  {
    switch(deviceLang)
    {
      case 'en':
        return RegExp(r'^[a-zA-Z0-9\s.,-]*$');
      case 'ur':
        return RegExp(r'^[\u0600-\u06FF0-9\s.,-]*$');
      case 'fr':
      case 'es':
      case 'tr':
        return RegExp(r'^[a-zA-Z0-9\s.,-\u00C0-\u00FF\u0100-\u024F]*$');
      case 'zh':
        return RegExp(r'^[\u4E00-\u9FFF\u3400-\u4DBF0-9\s.,-]*$');
      default :
        return RegExp(r'.*');
    }
  }

  String? nameValidator(String? value) {
    if ((value == null) || (value.isEmpty)) {
      return 'Please Enter Name';
    } else if (!getRegExp()
        .hasMatch(value)) {
      return 'Enter a valid Name';
    }
    return null;
  }

  String? phoneValidator(String? value) {
    if ((value == null) || (value.isEmpty)) {
      return 'Please Enter Phone Number';
    } else if (!RegExp(
      r'^(?:[+0]9)?[0-9\s]{10-12}$',
    ).hasMatch(value)) {
      return 'Enter a valid Phone';
    }
    return null;
  }
}
