import 'package:DummyInvoice/pages/add_items_page/add_items_viewmodel.dart';
import 'package:DummyInvoice/pages/edit_items_page/edit_item_viewmodel.dart';
import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:DummyInvoice/pages/items_page/item_page_repository.dart';
import 'package:DummyInvoice/pages/items_page/items_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/widgets/custom_text_fields.dart';
import 'package:flutter/services.dart';

class ViewItemsDetails extends StatefulWidget {
  const ViewItemsDetails({super.key,
    required this.id
  });
  final id;
  @override
  State<ViewItemsDetails> createState() => _ViewItemsDetailsState();
}

class _ViewItemsDetailsState extends State<ViewItemsDetails> {
  bool isToggled = false;
  final formKey = GlobalKey<FormState>();
  late HomePageViewmodel homePageViewmodel;
  ItemPageRepository itemPageRepository = ItemPageRepository();
  late ItemsPageViewmodel itemsPageViewmodel;
  AddItemViewmodel addItemViewmodel = AddItemViewmodel();
  late EditItemViewmodel editItemViewmodel;
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
    editItemViewmodel= EditItemViewmodel(id: widget.id);
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      await itemsPageViewmodel.loadItems();
      editItemViewmodel.getControllerText(itemsPageViewmodel);
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
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
                    isMandatory: true,
                    controller: editItemViewmodel.itemNameController,
                    maxLength: 40,
                    enabled: false,
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
                          isMandatory: true,
                          maxLength: 10,enabled: false,
                          controller: editItemViewmodel.itemPriceController,
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
                          isMandatory: false,enabled: false,
                          controller: editItemViewmodel.itemCodeController,
                          textInputType: TextInputType.phone,
                          maxLength: 10,

                        ),
                      ),
                    ],
                  ),

                  CustomTextFields(
                    labelText: addItemViewmodel.itemQuantityLabel,

                    isMandatory: true,
                    controller: editItemViewmodel.itemQuantityController,
                    textInputType: TextInputType.phone,
                    maxLength: 10,enabled: false,
                    inputFormatter: FilteringTextInputFormatter.allow(
                      RegExp(r'[0-9]+'),
                    ),
                  ),
                  CustomTextFields(
                    labelText: addItemViewmodel.itemCategoryLabel,

                    isMandatory: false,
                    controller: editItemViewmodel.itemCategoryController,
                    textInputType: TextInputType.text,
                    maxLength: 30,enabled: false,
                    inputFormatter: FilteringTextInputFormatter.allow(
                      RegExp(r'[a-zA-Z- 0-9]'),
                    ),
                  ),
                  CustomTextFields(
                    labelText: addItemViewmodel.itemUnitLabel,
                    isMandatory: false,enabled: false,
                    controller: editItemViewmodel.itemUnitController,
                    textInputType: TextInputType.text,
                    maxLength: 20,
                    inputFormatter: FilteringTextInputFormatter.allow(
                      RegExp(r'[a-zA-Z- 0-9]'),
                    ),
                  ),
                  SizedBox(height: 30),

                  SizedBox(height: 20),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
