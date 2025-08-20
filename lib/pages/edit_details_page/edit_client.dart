import 'package:DummyInvoice/pages/client_page/client_page_viewmodel.dart';
import 'package:DummyInvoice/pages/edit_details_page/edit_client_viewmode.dart';
import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/widgets/text_form_fields_mandatory.dart';
import 'package:provider/provider.dart';

class EditClient extends StatefulWidget {
  const EditClient({super.key,required this.id});
final id;
  @override
  State<EditClient> createState() => _EditClient();
}

class _EditClient extends State<EditClient> {
  late final EditClientViewmodel editClientViewmodel;
  @override
  void initState()
  {
    super.initState();
    editClientViewmodel = EditClientViewmodel();
  final clientPageViewmodel=Provider.of<ClientPageViewmodel>(context,listen: false);
  editClientViewmodel.firstNameController.text=clientPageViewmodel.client.value.elementAt(widget.id).firstName;
  editClientViewmodel.emailController.text=clientPageViewmodel.client.value.elementAt(widget.id).email;
  editClientViewmodel.lastNameController.text=clientPageViewmodel.client.value.elementAt(widget.id).lastname;
  editClientViewmodel.addressController.text=clientPageViewmodel.client.value.elementAt(widget.id).address;
  editClientViewmodel.phoneController.text=clientPageViewmodel.client.value.elementAt(widget.id).phoneNo;
  }
  bool _toggeled = false;
  @override
  Widget build(BuildContext context) {
    final clientPageViewmodel=context.watch<ClientPageViewmodel>();
    HomePageViewmodel homePageViewmodel=HomePageViewmodel();
    bool isDark=Theme.of(context).brightness==Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: homePageViewmodel.getBackColor(isDark),scrolledUnderElevation: 0,
        title: Text(
          editClientViewmodel.appBarTitle,
          style: TextStyle(color:homePageViewmodel.getTextColor(isDark),
              fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
      ),backgroundColor: homePageViewmodel.getBackColor(isDark),
      body: SafeArea(top: false,
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(
                left: homePageViewmodel.getWidth(context, 20),
                right: homePageViewmodel.getWidth(context, 20),
                bottom: homePageViewmodel.getWidth(context, 20)
            ),
            child: Column(
              children: [
                TextFormFieldsMandatory(
                  labelText: editClientViewmodel.firstNameLabel,
                  controller: editClientViewmodel.firstNameController,
                  isMandatory: true  ,

                ),
                TextFormFieldsMandatory(
                  labelText: editClientViewmodel.lastNameLabel,
                  controller: editClientViewmodel.lastNameController,
                  isMandatory: true,
                ),
                TextFormFieldsMandatory(
                  labelText: editClientViewmodel.emailAddress,
                  controller: editClientViewmodel.emailController,
                  isMandatory: false,

                ),
                TextFormFieldsMandatory(
                  labelText: editClientViewmodel.phoneNo,
                  controller: editClientViewmodel.phoneController,
                  isMandatory: true,
                ),
                TextFormFieldsMandatory(
                  labelText: editClientViewmodel.address,
                  controller: editClientViewmodel.addressController,
                  isMandatory: false,
                ),

                SizedBox(height: 30),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      editClientViewmodel.saveClientButtonText,
                      style: TextStyle(fontSize: 14,fontFamily: 'Biennale',
                        color: homePageViewmodel.getTextColor(isDark),
                      ),
                    ),

                    Switch(
                      value: _toggeled,
                      onChanged: (bool value) {
                        setState(() {
                          _toggeled = value;
                        });
                      },

                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: homePageViewmodel.getWidth(context, 297),
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
                      if (editClientViewmodel.firstNameController.text.isEmpty ||
                          editClientViewmodel.lastNameController.text.isEmpty||
                          editClientViewmodel.phoneController.text.isEmpty
                      )
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please fill out mandatory fields')),
                        );

                      }
                      else
                      {
                        clientPageViewmodel.editClient(widget.id,
                          newFirstName: editClientViewmodel.firstNameController
                              .text,
                          newLastName: editClientViewmodel.lastNameController
                              .text,
                          newEmailAddress: editClientViewmodel.emailController
                              .text,
                          newPhoneNo: editClientViewmodel.phoneController.text,
                          newAddress: editClientViewmodel.addressController
                              .text,
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
}
