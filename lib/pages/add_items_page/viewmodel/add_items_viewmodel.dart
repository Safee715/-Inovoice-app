import 'package:flutter/cupertino.dart';

class  AddItemsViewmodel extends ChangeNotifier{
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
  void resetFields() {
    itemNameController.clear();
    itemPriceController.clear();
    itemCodeController.clear();
    itemQuantityController.clear();
    itemCategoryController.clear();
    itemUnitController.clear();
    notifyListeners();
  }
}