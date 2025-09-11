import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/pages/items_page/viewmodel/items_page_viewmodel.dart';
import 'package:DummyInvoice/pages/itemsdetailspage/viewmodel/view_item_details_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/widgets/custom_text_fields.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ViewItemsDetails extends StatefulWidget {
  const ViewItemsDetails({
    super.key,
    required this.id,
  });
  final int id;
  @override
  State<ViewItemsDetails> createState() =>
      _ViewItemsDetailsState();
}

class _ViewItemsDetailsState
    extends State<ViewItemsDetails> {
  final formKey = GlobalKey<FormState>();

@override
void initState()
{
  super.initState();
    final itemsPageViewmodel = context.read<
        ItemsPageViewmodel>();
    final viewItemsDetailsViewmodel = context
        .read<ViewItemsDetailsViewmodel>();
    viewItemsDetailsViewmodel.getControllerText(
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
            color: Theme.of(context).getTextColor(),
          ),
        ),
        backgroundColor: Theme.of(context)
            .getBackColor(),
        scrolledUnderElevation: 0,
        title: Text(
          itemsPageViewmodel.ViewItemAppBarTitle,
          style: TextStyle(
            color: Theme.of(context).getTextColor(),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context)
          .getBackColor(),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: context.getWidth(
                20,
              ),
              right: context.getWidth(
                20,
              ),
              bottom: context.getWidth(
                20,
              ),
            ),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  _buildTextFields(),


                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildTextFields()
  {   final itemsPageViewmodel=context.read<ItemsPageViewmodel>();
  final viewItemsDetailsViewmodel=context.read<ViewItemsDetailsViewmodel>();
  return Column(
       children: [
         CustomTextFields(
           labelText: itemsPageViewmodel
               .itemNameLabel,
           isMandatory: true,
           controller: viewItemsDetailsViewmodel
               .itemNameController,
           maxLength: 40,
           enabled: false,
           validator: (p0) =>
               itemsPageViewmodel
                   .nameValidator(p0),
           inputFormatter:
           FilteringTextInputFormatter.allow(
             RegExp(r'[a-zA-Z0-9-]'),
           ),
         ),
         Row(
           mainAxisAlignment:
           MainAxisAlignment
               .spaceBetween,
           children: [
             Expanded(
               child: CustomTextFields(
                 labelText:
                 itemsPageViewmodel
                     .itemPriceLabel,
                 isMandatory: true,
                 prefix: '\$',
                 maxLength: 10,
                 enabled: false,
                 controller:
                 viewItemsDetailsViewmodel
                     .itemPriceController,
                 textInputType:
                 TextInputType.phone,
                 inputFormatter:
                 FilteringTextInputFormatter.allow(
                   RegExp(r'[0-9]'),
                 ),
               ),
             ),
             SizedBox(
               width: context
                   .getWidth(40),
             ),
             Expanded(
               child: CustomTextFields(
                 labelText:
                 itemsPageViewmodel
                     .itemCodeLabel,
                 isMandatory: false,
                 enabled: false,
                 controller:
                 viewItemsDetailsViewmodel
                     .itemCodeController,
                 textInputType:
                 TextInputType.phone,
                 maxLength: 10,
               ),
             ),
           ],
         ),

         CustomTextFields(
           labelText: itemsPageViewmodel
               .itemQuantityLabel,

           isMandatory: true,
           controller: viewItemsDetailsViewmodel
               .itemQuantityController,
           textInputType:
           TextInputType.phone,
           maxLength: 10,
           enabled: false,
           inputFormatter:
           FilteringTextInputFormatter.allow(
             RegExp(r'[0-9]+'),
           ),
         ),
         CustomTextFields(
           labelText: itemsPageViewmodel
               .itemCategoryLabel,

           isMandatory: false,
           controller: viewItemsDetailsViewmodel
               .itemCategoryController,
           textInputType:
           TextInputType.text,
           maxLength: 30,
           enabled: false,
           inputFormatter:
           FilteringTextInputFormatter.allow(
             RegExp(
               r'[a-zA-Z- 0-9]',
             ),
           ),
         ),
         CustomTextFields(
           labelText: itemsPageViewmodel
               .itemUnitLabel,
           isMandatory: false,
           enabled: false,
           controller: viewItemsDetailsViewmodel
               .itemUnitController,
           textInputType:
           TextInputType.text,
           maxLength: 20,
           inputFormatter:
           FilteringTextInputFormatter.allow(
             RegExp(
               r'[a-zA-Z- 0-9]',
             ),
           ),
         ),
       ],
    );
  }
}
