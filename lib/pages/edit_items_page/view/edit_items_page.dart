import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/pages/edit_items_page/viewmodel/edit_item_viewmodel.dart';
import 'package:DummyInvoice/pages/items_page/viewmodel/items_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/widgets/custom_text_fields.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class EditItemsPage extends StatefulWidget {
  const EditItemsPage({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<EditItemsPage> createState() =>
      _EditItemsPageState();
}

class _EditItemsPageState
    extends State<EditItemsPage> {
  bool isToggled = false;
  final formKey = GlobalKey<FormState>();

@override
void initState()
{
  super.initState();
    final editItemViewmodel = context.read<
        EditItemViewmodel>();
    final itemsPageViewmodel = context.read<
        ItemsPageViewmodel>();
    editItemViewmodel.getControllerText(
        itemsPageViewmodel, widget.id);

}

  @override
  Widget build(BuildContext context) {
    final itemsPageViewmodel=context.watch<ItemsPageViewmodel>();

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
          itemsPageViewmodel.EditItemAppBarTitle,
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
                  _buildCustomTextFields(),
                  SizedBox(height: 20),
                  _buildCustomSaveButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomSaveButton() {
    final  editItemViewmodel = context.watch<EditItemViewmodel>();
    final itemsPageViewmodel=context.watch<ItemsPageViewmodel>();
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
            itemsPageViewmodel.editItem(
              widget.id,
              editItemViewmodel
                  .itemNameController
                  .text,
              editItemViewmodel
                  .itemPriceController
                  .text,
              editItemViewmodel
                  .itemCodeController
                  .text,
              editItemViewmodel
                  .itemQuantityController
                  .text,
              editItemViewmodel
                  .itemCategoryController
                  .text,
              editItemViewmodel
                  .itemUnitController
                  .text,
            );
            Navigator.pop(context);
          } else {}
        },
        child: Text(
          itemsPageViewmodel.SaveItemButtonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCustomTextFields() {
    final editItemViewmodel = context.watch<EditItemViewmodel>();
    final itemsPageViewmodel=context.watch<ItemsPageViewmodel>();
    return Column(
      children: [
        CustomTextFields(
          labelText:
              itemsPageViewmodel.itemNameLabel,
          isMandatory: true,
          controller: editItemViewmodel
              .itemNameController,
          maxLength: 40,
          validator: (p0) => itemsPageViewmodel
              .nameValidator(p0),
          inputFormatter:
              FilteringTextInputFormatter.allow(
                itemsPageViewmodel.getRegExp(),
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
                isMandatory: true,
                maxLength: 10,
                controller: editItemViewmodel
                    .itemPriceController,
                textInputType:
                    TextInputType.phone,
                prefix: '\$',
                inputFormatter:
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[0-9]'),
                    ),
              ),
            ),
            SizedBox(width: context.getWidth(40)),
            Expanded(
              child: CustomTextFields(
                labelText: itemsPageViewmodel
                    .itemCodeLabel,
                isMandatory: false,
                controller: editItemViewmodel
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
          itemsPageViewmodel.itemQuantityLabel,

          isMandatory: true,
          controller: editItemViewmodel
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
          itemsPageViewmodel.itemCategoryLabel,

          isMandatory: false,
          controller: editItemViewmodel
              .itemCategoryController,
          textInputType: TextInputType.text,
          maxLength: 30,
          inputFormatter:
              FilteringTextInputFormatter.allow(
                itemsPageViewmodel.getRegExp(),
              ),
        ),
        CustomTextFields(
          labelText:
          itemsPageViewmodel.itemUnitLabel,
          isMandatory: false,
          controller: editItemViewmodel
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
}
