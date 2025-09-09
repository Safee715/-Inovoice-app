import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/pages/add_items_page/viewmodel/add_items_viewmodel.dart';
import 'package:DummyInvoice/pages/items_page/viewmodel/items_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/widgets/custom_text_fields.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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

  @override
  void initState()
  {
    super.initState();
    final addItemsViewmodel=context.read<AddItemsViewmodel>();
    WidgetsBinding.instance.addPostFrameCallback((_)
    {
      addItemsViewmodel.resetFields();
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    final itemsPageViewmodel =context.read<ItemsPageViewmodel>();
    print('AddItemsPageBuild');

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
          itemsPageViewmodel.addItemAppBarTitle,
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
    final itemsPageViewmodel =context.read<ItemsPageViewmodel>();//for labels and crud operations
    final addItemsViewmodel=context.watch<AddItemsViewmodel>();//for controllers
    return Column(
      children: [
        CustomTextFields(
          labelText:
          itemsPageViewmodel.itemNameLabel,
          hintText: itemsPageViewmodel.itemName,
          isMandatory: true,
          controller: addItemsViewmodel
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
                labelText: itemsPageViewmodel
                    .itemPriceLabel,
                hintText:
                itemsPageViewmodel.itemPrice,
                isMandatory: true,
                prefix: '\$',
                maxLength: 10,
                controller: addItemsViewmodel
                    .itemPriceController,
                textInputType:
                    TextInputType.phone,
                inputFormatter:
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[0-9]'),
                    ),
                validator: (p0) => itemsPageViewmodel
                    .priceValidator(p0),
              ),
            ),
            SizedBox(width: context.getWidth(40)),
            Expanded(
              child: CustomTextFields(
                labelText: itemsPageViewmodel
                    .itemCodeLabel,
                hintText:
                itemsPageViewmodel.itemCode,
                isMandatory: true,
                controller: addItemsViewmodel
                    .itemCodeController,
                textInputType:
                    TextInputType.phone,
                maxLength: 10,
                validator: (p0) => itemsPageViewmodel
                    .codeValidator(p0),
              ),
            ),
          ],
        ),

        CustomTextFields(
          labelText:
          itemsPageViewmodel.itemQuantityLabel,
          hintText: itemsPageViewmodel.itemQuantity,
          isMandatory: true,
          controller: addItemsViewmodel
              .itemQuantityController,
          textInputType: TextInputType.phone,
          maxLength: 10,
          validator: (p0) => itemsPageViewmodel
              .quantityValidator(p0),
          inputFormatter:
              FilteringTextInputFormatter.allow(
                RegExp(r'[0-9]+'),
              ),
        ),
        CustomTextFields(
          labelText:
          itemsPageViewmodel.itemCategoryLabel,
          hintText: itemsPageViewmodel.itemCategory,
          isMandatory: false,
          controller: addItemsViewmodel
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
          itemsPageViewmodel.itemUnitLabel,
          hintText: itemsPageViewmodel.itemUnit,
          isMandatory: false,
          controller: addItemsViewmodel
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
    final itemsPageViewmodel=context.read<ItemsPageViewmodel>();
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
            final addItemViewmodel=context.read<AddItemsViewmodel>();
            itemsPageViewmodel.addItem(
                itemName: addItemViewmodel.itemNameController.text,
                itemPrice: addItemViewmodel.itemPriceController.text,
                itemCode: addItemViewmodel.itemCodeController.text,
                itemQuantity: addItemViewmodel.itemQuantityController.text,
                itemCategory: addItemViewmodel.itemCategoryController.text,
                itemUnit: addItemViewmodel.itemUnitController.text);
            Navigator.pop(context);
          } else {}
        },
        child: Text(
          itemsPageViewmodel.addButtonText,
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
