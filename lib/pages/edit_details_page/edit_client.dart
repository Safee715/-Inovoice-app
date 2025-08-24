import 'package:DummyInvoice/pages/client_page/client_page_viewmodel.dart';
import 'package:DummyInvoice/pages/edit_details_page/edit_client_viewmode.dart';
import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/widgets/custom_text_fields.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class EditClient extends StatefulWidget {
  const EditClient({super.key, required this.id});

  final id;

  @override
  State<EditClient> createState() => _EditClient();
}

class _EditClient extends State<EditClient> {
  late final EditClientViewmodel editClientViewmodel;
  late HomePageViewmodel homePageViewmodel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    homePageViewmodel = HomePageViewmodel(
      screenWidth: MediaQuery.of(context).size.width,
      screenHeight: MediaQuery.of(context).size.height,
    );
  }

  @override
  void initState() {
    super.initState();
    editClientViewmodel = EditClientViewmodel();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final clientPageViewmodel = context.read<ClientPageViewmodel>();
      editClientViewmodel.getControllerText(clientPageViewmodel, widget.id);
    });
  }

  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final clientPageViewmodel = context.watch<ClientPageViewmodel>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: homePageViewmodel.getBackColor(isDark),
        scrolledUnderElevation: 0,
        title: Text(
          editClientViewmodel.appBarTitle,
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
            child: Column(
              children: [
                CustomTextFields(
                  labelText: editClientViewmodel.firstNameLabel,
                  controller: editClientViewmodel.firstNameController,
                  isMandatory: true,
                  maxLength: 40,
                  validator: (p0) => clientPageViewmodel.nameValidator(p0),
                  inputFormatter: FilteringTextInputFormatter.allow(
                    RegExp(r'[a-zA-Z- ]'),
                  ),
                ),
                CustomTextFields(
                  labelText: editClientViewmodel.lastNameLabel,
                  controller: editClientViewmodel.lastNameController,
                  isMandatory: true,
                  validator: (p0) => clientPageViewmodel.nameValidator(p0),
                  inputFormatter: FilteringTextInputFormatter.allow(
                    RegExp(r'[a-zA-Z- ]'),
                  ),
                ),
                CustomTextFields(
                  labelText: editClientViewmodel.emailAddress,
                  controller: editClientViewmodel.emailController,
                  isMandatory: false,
                  textInputType: TextInputType.emailAddress,
                  maxLength: 70,
                  validator: (p0) => clientPageViewmodel.emailValidator(p0),
                ),
                CustomTextFields(
                  labelText: editClientViewmodel.phoneNo,
                  controller: editClientViewmodel.phoneController,
                  isMandatory: true,
                  textInputType: TextInputType.phone,
                  maxLength: 11,
                  inputFormatter: FilteringTextInputFormatter.allow(
                    RegExp(r'[0-9]+'),
                  ),
                ),
                CustomTextFields(
                  labelText: editClientViewmodel.address,
                  controller: editClientViewmodel.addressController,
                  isMandatory: false,
                  textInputType: TextInputType.text,
                  inputFormatter: FilteringTextInputFormatter.allow(
                    RegExp(r'[a-zA-Z- ]'),
                  ),

                  maxLength: 70,
                ),

                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      editClientViewmodel.saveClientButtonText,
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Biennale',
                        color: homePageViewmodel.getTextColor(isDark),
                      ),
                    ),

                    Switch(
                      value: isToggled,
                      onChanged: (bool value) {
                        setState(() {
                          isToggled = value;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: homePageViewmodel.getWidth(297),
                  height: 40,
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
                    onPressed: () {
                      if (editClientViewmodel
                              .firstNameController
                              .text
                              .isEmpty ||
                          editClientViewmodel.lastNameController.text.isEmpty ||
                          editClientViewmodel.phoneController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Please fill out mandatory fields'),
                          ),
                        );
                      } else {
                        clientPageViewmodel.editClient(
                          widget.id,
                          newFirstName:
                              editClientViewmodel.firstNameController.text,
                          newLastName:
                              editClientViewmodel.lastNameController.text,
                          newEmailAddress:
                              editClientViewmodel.emailController.text,
                          newPhoneNo: editClientViewmodel.phoneController.text,
                          newAddress:
                              editClientViewmodel.addressController.text,
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      editClientViewmodel.addButtonText,
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
    );
  }

  @override
  void dispose() {
    editClientViewmodel.dispose();
    super.dispose();
  }
}
