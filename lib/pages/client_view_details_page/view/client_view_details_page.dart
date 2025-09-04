import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/pages/client_page/viewmodel/client_page_viewmodel.dart';
import 'package:DummyInvoice/pages/client_view_details_page/viewmodel/view_details_viewmodel.dart';
import 'package:DummyInvoice/widgets/custom_text_fields.dart';
import 'package:flutter/material.dart';

class ClientViewDetailsPage
    extends StatefulWidget {
  const ClientViewDetailsPage({
    super.key,
    required this.id,
    required this.clientPageViewmodel,
  });

  final int id;
  final ClientPageViewmodel clientPageViewmodel;

  @override
  State<ClientViewDetailsPage> createState() =>
      _ClientViewDetailsPageState();
}

class _ClientViewDetailsPageState
    extends State<ClientViewDetailsPage> {
  late ViewDetailsViewmodel viewDetailsViewmodel;

  @override
  void initState() {
    super.initState();
    viewDetailsViewmodel = ViewDetailsViewmodel(
      id: widget.id,
    );

    WidgetsBinding.instance.addPostFrameCallback((
      _,
    ) async {
      viewDetailsViewmodel.getControllerText(
        widget.clientPageViewmodel,
      );
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Theme.of(
          context,
        ).getBackColor(),
        scrolledUnderElevation: 0,
        title: Text(
          viewDetailsViewmodel.appBarTitle,
          style: TextStyle(
            color: Theme.of(
              context,
            ).getTextColor(),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: context.getWidth(20),
            ),
            color: Theme.of(
              context,
            ).getAppBarBottomColor(),
            height: 1,
          ),
        ),
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
            child: Column(
              children: [
                _buildCustomTextFields(),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomTextFields() {
    return Column(
      children: [
        CustomTextFields(
          labelText:
              viewDetailsViewmodel.firstNameLabel,
          controller: viewDetailsViewmodel
              .firstNameController,
          isMandatory: true,
          enabled: false,
        ),
        CustomTextFields(
          labelText:
              viewDetailsViewmodel.lastNameLabel,
          controller: viewDetailsViewmodel
              .lastNameController,
          isMandatory: true,
          enabled: false,
        ),
        CustomTextFields(
          labelText:
              viewDetailsViewmodel.emailAddress,
          controller: viewDetailsViewmodel
              .emailController,
          isMandatory: false,
          enabled: false,
        ),
        CustomTextFields(
          labelText: viewDetailsViewmodel.phoneNo,
          controller: viewDetailsViewmodel
              .phoneController,
          isMandatory: true,
          enabled: false,
        ),
        CustomTextFields(
          labelText: viewDetailsViewmodel.address,
          controller: viewDetailsViewmodel
              .addressController,
          isMandatory: false,
          enabled: false,
        ),
      ],
    );
  }
}
