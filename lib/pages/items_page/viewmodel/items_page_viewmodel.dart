import 'package:DummyInvoice/data/languages/language_manager.dart';
import 'package:DummyInvoice/data/notifiers.dart';
import 'package:DummyInvoice/main.dart';
import 'package:DummyInvoice/pages/items_page/model/item_page_model.dart';
import 'package:DummyInvoice/pages/items_page/repo/item_page_repository.dart';
import 'package:flutter/material.dart';

class ItemsPageViewmodel extends ChangeNotifier {
  ItemsPageViewmodel(this.repo)
  {
    getItems();
  }

  final ItemPageRepository repo;

  List<Item> _items = [];
  final addItemAppBarTitle = LanguageManager.translate('addItemAppBarTitle');
  final ViewItemAppBarTitle = LanguageManager.translate('ViewItemAppBarTitle');
  final EditItemAppBarTitle = LanguageManager.translate('EditItemAppBarTitle');
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
  final SaveItemButtonText = LanguageManager.translate('SaveItemButtonText');
  final SaveButtonText = LanguageManager.translate('SaveButtonText');

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

  Future<void> getItems() async {
    await repo.openDb();
    _items = await repo.getAllItems();
    notifyListeners();
  }

  int getItemsNumber() {
    return _items.length;
  }

  Item getItem(int id) {
    return _items[id];
  }
  Item getItemByDbId(int dbId) {
    return _items.firstWhere((element) => element.id==dbId);
  }

  void addItem(
  {
    required String itemName,
    required String itemPrice,
    required String itemCode,
    required String itemQuantity,
    required String itemCategory,
    required String itemUnit,
}) async {
    await repo.openDb();
    await repo.insertItem(
      Item(
        itemName: itemName,
        itemPrice: double.parse(
          itemPrice,
        ),
        itemCode: double.parse(
          itemCode,
        ),
        itemQuantity: int.parse(
          itemQuantity,
        ),
        itemCategory: itemCategory,
        itemUnit: itemUnit,
      ),
    );
  await  getItems();
    notifyListeners();

  }

  void deleteItem(int id) async {
    await repo.openDb();
    await repo.deleteItem(id);
    await    getItems();
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
    await    getItems();
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

  RegExp getRegExp() {
    switch (deviceLang) {
      case 'en':
        return RegExp(r'^[a-zA-Z0-9\s.,-]*$');
      case 'ur':
        return RegExp(
          r'^[\u0600-\u06FF0-9\s.,-]*$',
        );
      case 'fr':
      case 'es':
      case 'tr':
        return RegExp(
          r'^[a-zA-Z0-9\s.,-\u00C0-\u00FF\u0100-\u024F]*$',
        );
      case 'zh':
        return RegExp(
          r'^[\u4E00-\u9FFF\u3400-\u4DBF0-9\s.,-]*$',
        );
      default:
        return RegExp(r'.*');
    }
  }

  String? nameValidator(String? value) {
    if ((value == null) || (value.isEmpty)) {
      return 'Please Enter Name';
    } else if (!getRegExp().hasMatch(value)) {
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
