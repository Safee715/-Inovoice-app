import 'package:DummyInvoice/data/notifiers.dart';
import 'package:DummyInvoice/pages/add_items_page/add_items_viewmodel.dart';
import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:DummyInvoice/pages/items_page/item_page_repository.dart';
import 'package:DummyInvoice/pages/items_page/items_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/widgets/custom_text_fields.dart';
import 'package:flutter/services.dart';

class AddItemsPage extends StatefulWidget {
  const AddItemsPage({super.key});

  @override
  State<AddItemsPage> createState() => _AddItemsPageState();
}

class _AddItemsPageState extends State<AddItemsPage> {
  bool isToggled = false;
  final formKey = GlobalKey<FormState>();
  late HomePageViewmodel homePageViewmodel;
  ItemPageRepository itemPageRepository = ItemPageRepository();
  late ItemsPageViewmodel itemsPageViewmodel;
  AddItemViewmodel addItemViewmodel = AddItemViewmodel();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    homePageViewmodel = HomePageViewmodel(
      screenWidth: MediaQuery.of(context).size.width,
      screenHeight: MediaQuery.of(context).size.height,
    );
  }
  @override
  void initState()
  {
    super.initState();
    itemsPageViewmodel = ItemsPageViewmodel(itemPageRepository);

  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            selected_page_notifier.value == 3
                ? selected_page_notifier.value = 0
                : Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: homePageViewmodel.getTextColor(isDark),
          ),
        ),
        backgroundColor: homePageViewmodel.getBackColor(isDark),
        scrolledUnderElevation: 0,
        title: Text(
          addItemViewmodel.appBarTitle,
          style: TextStyle(
            color: homePageViewmodel.getTextColor(isDark),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: homePageViewmodel.getBackColor(isDark),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: homePageViewmodel.getWidth(20),
              right: homePageViewmodel.getWidth(20),
              bottom: homePageViewmodel.getWidth(20),
            ),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextFields(
                    labelText: addItemViewmodel.itemNameLabel,
                    hintText: addItemViewmodel.itemName,
                    isMandatory: true,
                    controller: itemsPageViewmodel.itemNameController,
                    maxLength: 40,
                    validator: (p0) => itemsPageViewmodel.nameValidator(p0),
                    inputFormatter: FilteringTextInputFormatter.allow(
                      RegExp(r'[a-zA-Z0-9-]'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomTextFields(
                          labelText: addItemViewmodel.itemPriceLabel,
                          hintText: addItemViewmodel.itemPrice,
                          isMandatory: true,
                          maxLength: 10,
                          controller: itemsPageViewmodel.itemPriceController,
                          textInputType: TextInputType.phone,
                          inputFormatter: FilteringTextInputFormatter.allow(
                            RegExp(r'[0-9]'),
                          ),
                        ),
                      ),
                      SizedBox(width: homePageViewmodel.getWidth(40)),
                      Expanded(
                        child: CustomTextFields(
                          labelText: addItemViewmodel.itemCodeLabel,
                          hintText: addItemViewmodel.itemCode,
                          isMandatory: false,
                          controller: itemsPageViewmodel.itemCodeController,
                          textInputType: TextInputType.phone,
                          maxLength: 10,

                        ),
                      ),
                    ],
                  ),

                  CustomTextFields(
                    labelText: addItemViewmodel.itemQuantityLabel,
                    hintText: addItemViewmodel.itemQuantity,
                    isMandatory: true,
                    controller: itemsPageViewmodel.itemQuantityController,
                    textInputType: TextInputType.phone,
                    maxLength: 10,
                    inputFormatter: FilteringTextInputFormatter.allow(
                      RegExp(r'[0-9]+'),
                    ),
                  ),
                  CustomTextFields(
                    labelText: addItemViewmodel.itemCategoryLabel,
                    hintText: addItemViewmodel.itemCategory,
                    isMandatory: false,
                    controller: itemsPageViewmodel.itemCategoryController,
                    textInputType: TextInputType.text,
                    maxLength: 30,
                    inputFormatter: FilteringTextInputFormatter.allow(
                      RegExp(r'[a-zA-Z- 0-9]'),
                    ),
                  ),
                  CustomTextFields(
                    labelText: addItemViewmodel.itemUnitLabel,
                    hintText: addItemViewmodel.itemUnit,
                    isMandatory: false,
                    controller: itemsPageViewmodel.itemUnitController,
                    textInputType: TextInputType.text,
                    maxLength: 20,
                    inputFormatter: FilteringTextInputFormatter.allow(
                      RegExp(r'[a-zA-Z- 0-9]'),
                    ),
                  ),
                  SizedBox(height: 30),

                  SizedBox(height: 20),
                  Container(
                    width: homePageViewmodel.getWidth(187),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      gradient: LinearGradient(
                        colors: [Color(0xFF9CD9FF), Color(0xFF4082E3)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                         itemsPageViewmodel.addItem();
                              Navigator.pop(context);

                        } else {}
                      },
                      child: Text(
                        addItemViewmodel.addButtonText,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
