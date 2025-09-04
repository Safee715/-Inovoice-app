import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/pages/add_items_page/viewmodel/add_items_viewmodel.dart';
import 'package:DummyInvoice/pages/items_page/repo/item_page_repository.dart';
import 'package:DummyInvoice/pages/items_page/viewmodel/items_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/widgets/custom_text_fields.dart';
import 'package:flutter/services.dart';

class AddItemsPage extends StatefulWidget {
  const AddItemsPage({super.key});

  @override
  State<AddItemsPage> createState() =>
      _AddItemsPageState();
}

class _AddItemsPageState
    extends State<AddItemsPage> {
  bool isToggled = false;
  final formKey = GlobalKey<FormState>();
  ItemPageRepository itemPageRepository =
      ItemPageRepository();
  late ItemsPageViewmodel itemsPageViewmodel;
  AddItemViewmodel addItemViewmodel =
      AddItemViewmodel();

  @override
  void initState() {
    super.initState();
    itemsPageViewmodel = ItemsPageViewmodel(
      itemPageRepository,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Theme.of(
              context,
            ).getTextColor(),
          ),
        ),
        backgroundColor: Theme.of(
          context,
        ).getBackColor(),
        scrolledUnderElevation: 0,
        title: Text(
          addItemViewmodel.addItemAppBarTitle,
          style: TextStyle(
            color: Theme.of(
              context,
            ).getTextColor(),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(
        context,
      ).getBackColor(),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: context.getWidth(20),
              right: context.getWidth(20),
              bottom: context.getWidth(20),
            ),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  _customTextFields(),
                  SizedBox(height: 30),
                  SizedBox(height: 20),
                  _buildSaveButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _customTextFields() {
    return Column(
      children: [
        CustomTextFields(
          labelText:
              addItemViewmodel.itemNameLabel,
          hintText: addItemViewmodel.itemName,
          isMandatory: true,
          controller: itemsPageViewmodel
              .itemNameController,
          maxLength: 40,
          validator: (p0) => itemsPageViewmodel
              .nameValidator(p0),
          inputFormatter:
              FilteringTextInputFormatter.allow(
                  itemsPageViewmodel.getRegExp()
              ),
        ),

        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomTextFields(
                labelText: addItemViewmodel
                    .itemPriceLabel,
                hintText:
                    addItemViewmodel.itemPrice,
                isMandatory: true,
                prefix: '\$',
                maxLength: 10,
                controller: itemsPageViewmodel
                    .itemPriceController,
                textInputType:
                    TextInputType.phone,
                inputFormatter:
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[0-9]'),
                    ),
              ),
            ),
            SizedBox(width: context.getWidth(40)),
            Expanded(
              child: CustomTextFields(
                labelText: addItemViewmodel
                    .itemCodeLabel,
                hintText:
                    addItemViewmodel.itemCode,
                isMandatory: false,
                controller: itemsPageViewmodel
                    .itemCodeController,
                textInputType:
                    TextInputType.phone,
                maxLength: 10,
              ),
            ),
          ],
        ),

        CustomTextFields(
          labelText:
              addItemViewmodel.itemQuantityLabel,
          hintText: addItemViewmodel.itemQuantity,
          isMandatory: true,
          controller: itemsPageViewmodel
              .itemQuantityController,
          textInputType: TextInputType.phone,
          maxLength: 10,
          inputFormatter:
              FilteringTextInputFormatter.allow(
                RegExp(r'[0-9]+'),
              ),
        ),
        CustomTextFields(
          labelText:
              addItemViewmodel.itemCategoryLabel,
          hintText: addItemViewmodel.itemCategory,
          isMandatory: false,
          controller: itemsPageViewmodel
              .itemCategoryController,
          textInputType: TextInputType.text,
          maxLength: 30,
          inputFormatter:
              FilteringTextInputFormatter.allow(
                  itemsPageViewmodel.getRegExp()
              ),
        ),
        CustomTextFields(
          labelText:
              addItemViewmodel.itemUnitLabel,
          hintText: addItemViewmodel.itemUnit,
          isMandatory: false,
          controller: itemsPageViewmodel
              .itemUnitController,
          textInputType: TextInputType.text,
          maxLength: 20,
          inputFormatter:
              FilteringTextInputFormatter.allow(
              itemsPageViewmodel.getRegExp(),
              ),
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return Container(
      width: context.getWidth(187),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        gradient: LinearGradient(
          colors: [
            Color(0xFF9CD9FF),
            Color(0xFF4082E3),
          ],
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
    );
  }
}
