import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/pages/client_page/viewmodel/client_page_viewmodel.dart';
import 'package:DummyInvoice/pages/edit_details_page/viewmodel/edit_client_viewmode.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/widgets/custom_text_fields.dart';
import 'package:flutter/services.dart';

class EditClient extends StatefulWidget {
  const EditClient({super.key,
    required this.id,
    this.constants,
    required this.clientPageViewmodel,
  });

  final int id;
  final Constants ?constants;
  final ClientPageViewmodel clientPageViewmodel;

  @override
  State<EditClient> createState() =>
      _EditClient();
}

class _EditClient extends State<EditClient> {
  late  EditClientViewmodel editClientViewmodel;
  @override
  void initState() {
    super.initState();

    editClientViewmodel = EditClientViewmodel(id: widget.id);
    WidgetsBinding.instance.addPostFrameCallback((
      _,
    )async {
      editClientViewmodel.getControllerText(
       widget.clientPageViewmodel,
      );
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(
          context,
        ).getBackColor(),
        scrolledUnderElevation: 0,
        title: Text(
          editClientViewmodel.appBarTitle,
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
            child: Column(
              children: [
                _buildCustomDetailsFields(widget.clientPageViewmodel),
                SizedBox(height: 20),
                _buildSaveButton(widget.clientPageViewmodel),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildSaveButton(ClientPageViewmodel clientPageViewmodel)
  {
    return Container(
      width: context.getWidth(297),
      height: 40,
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(
          5.0,
        ),
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
        style:
        ElevatedButton.styleFrom(
          backgroundColor:
          Colors.transparent,
          shadowColor:
          Colors.transparent,
        ),
        onPressed: () {
          if (editClientViewmodel
              .firstNameController
              .text
              .isEmpty ||
              editClientViewmodel
                  .lastNameController
                  .text
                  .isEmpty ||
              editClientViewmodel
                  .phoneController
                  .text
                  .isEmpty) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(
              SnackBar(
                content: Text(widget.constants!.snackBarText),
              ),
            );
          } else {
            clientPageViewmodel.editClient(
              widget.id,
              newFirstName:
              editClientViewmodel
                  .firstNameController
                  .text,
              newLastName:
              editClientViewmodel
                  .lastNameController
                  .text,
              newEmailAddress:
              editClientViewmodel
                  .emailController
                  .text,
              newPhoneNo:
              editClientViewmodel
                  .phoneController
                  .text,
              newAddress:
              editClientViewmodel
                  .addressController
                  .text,
            );
            Navigator.pop(context);
          }
        },
        child: Text(
          editClientViewmodel
              .addButtonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight:
            FontWeight.bold,
          ),
        ),
      ),
    );
  }
  Widget _buildCustomDetailsFields(ClientPageViewmodel clientPageViewmodel)
  {
    return Column(
      children: [CustomTextFields(
        labelText: editClientViewmodel
            .firstNameLabel,
        controller: editClientViewmodel
            .firstNameController,
        isMandatory: true,
        maxLength: 40,
        validator: (p0) =>
            clientPageViewmodel
                .nameValidator(p0),
        inputFormatter:
        FilteringTextInputFormatter.allow(
          RegExp(r'[a-zA-Z- ]'),
        ),
      ),
        CustomTextFields(
          labelText: editClientViewmodel
              .lastNameLabel,
          controller: editClientViewmodel
              .lastNameController,
          isMandatory: true,
          validator: (p0) =>
              clientPageViewmodel
                  .nameValidator(p0),
          inputFormatter:
          FilteringTextInputFormatter.allow(
            RegExp(r'[a-zA-Z- ]'),
          ),
        ),
        CustomTextFields(
          labelText: editClientViewmodel
              .emailAddress,
          controller: editClientViewmodel
              .emailController,
          isMandatory: false,
          textInputType:
          TextInputType.emailAddress,
          maxLength: 70,
          validator: (p0) =>
              clientPageViewmodel
                  .emailValidator(p0),
        ),
        CustomTextFields(
          labelText:
          editClientViewmodel.phoneNo,
          controller: editClientViewmodel
              .phoneController,
          isMandatory: true,
          textInputType:
          TextInputType.phone,
          maxLength: 11,
          inputFormatter:
          FilteringTextInputFormatter.allow(
            RegExp(r'[0-9]+'),
          ),
        ),
        CustomTextFields(
          labelText:
          editClientViewmodel.address,
          controller: editClientViewmodel
              .addressController,
          isMandatory: false,
          textInputType:
          TextInputType.text,
          inputFormatter:
          FilteringTextInputFormatter.allow(
            RegExp(r'[a-zA-Z- ]'),
          ),

          maxLength: 70,
        ),],
    );
  }

  @override
  void dispose() {
    editClientViewmodel.dispose();
    super.dispose();
  }
}
