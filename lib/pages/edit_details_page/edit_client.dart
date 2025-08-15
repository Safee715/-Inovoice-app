import 'package:DummyInvoice/pages/edit_details_page/edit_client_viewmode.dart';
import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/widgets/text_form_fields_mandatory.dart';

class EditClient extends StatefulWidget {
  const EditClient({super.key});

  @override
  State<EditClient> createState() => _EditClient();
}

class _EditClient extends State<EditClient> {
  bool _toggeled = false;
  @override
  Widget build(BuildContext context) {
    EditClientViewmodel editClientViewmodel = EditClientViewmodel();
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
                  hintText: editClientViewmodel.firstName,
                  isMandatory: true,
                ),
                TextFormFieldsMandatory(
                  labelText: editClientViewmodel.lastNameLabel,
                  hintText: editClientViewmodel.lastName,
                  isMandatory: true,
                ),
                TextFormFieldsMandatory(
                  labelText: editClientViewmodel.emailAddress,
                  hintText: editClientViewmodel.emailAddressHint,
                  isMandatory: false,

                ),
                TextFormFieldsMandatory(
                  labelText: editClientViewmodel.phoneNo,
                  hintText: editClientViewmodel.phoneNoHint,
                  isMandatory: true,
                ),
                TextFormFieldsMandatory(
                  labelText: editClientViewmodel.address,
                  hintText: editClientViewmodel.addressHint,
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
                    onPressed: () {},
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
