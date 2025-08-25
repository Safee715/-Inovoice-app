import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/pages/client_page/client_page_viewmodel.dart';
import 'package:DummyInvoice/pages/view_details_page/view_details_viewmodel.dart';
import 'package:DummyInvoice/widgets/custom_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewDetailsPage extends StatefulWidget {
  const ViewDetailsPage({
    super.key,
    required this.id,
  });
  final int  id;
  @override
  State<ViewDetailsPage> createState() =>
      _ViewDetailsPageState();
}

class _ViewDetailsPageState
    extends State<ViewDetailsPage> {
  late ViewDetailsViewmodel viewDetailsViewmodel;


  @override
  void initState() {
    super.initState();
    viewDetailsViewmodel = ViewDetailsViewmodel();
    final clientPageViewmodel = context
        .read<ClientPageViewmodel>();
    viewDetailsViewmodel.getControllerText(
      clientPageViewmodel,
      widget.id,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Theme.of(context)
            .getBackColor(),
        scrolledUnderElevation: 0,
        title: Text(
          viewDetailsViewmodel.appBarTitle,
          style: TextStyle(
            color:  Theme.of(context).getTextColor(),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: context
                  .getWidth(20),
            ),
            color: Theme.of(context).getAppBarBottomColor(),
            height: 1,
          ),
        ),
      ),
      backgroundColor:  Theme.of(context)
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
            child: Column(
              children: [
                CustomTextFields(
                  labelText: viewDetailsViewmodel
                      .firstNameLabel,
                  controller: viewDetailsViewmodel
                      .firstNameController,
                  isMandatory: true,
                  enabled: false,
                ),
                CustomTextFields(
                  labelText: viewDetailsViewmodel
                      .lastNameLabel,
                  controller: viewDetailsViewmodel
                      .lastNameController,
                  isMandatory: true,
                  enabled: false,
                ),
                CustomTextFields(
                  labelText: viewDetailsViewmodel
                      .emailAddress,
                  controller: viewDetailsViewmodel
                      .emailController,
                  isMandatory: false,
                  enabled: false,
                ),
                CustomTextFields(
                  labelText: viewDetailsViewmodel
                      .phoneNo,
                  controller: viewDetailsViewmodel
                      .phoneController,
                  isMandatory: true,
                  enabled: false,
                ),
                CustomTextFields(
                  labelText: viewDetailsViewmodel
                      .address,
                  controller: viewDetailsViewmodel
                      .addressController,
                  isMandatory: false,
                  enabled: false,
                ),

                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
