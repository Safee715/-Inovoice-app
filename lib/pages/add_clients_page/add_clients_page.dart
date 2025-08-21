import 'package:DummyInvoice/data/notifiers.dart';
import 'package:DummyInvoice/pages/client_page/client_page_viewmodel.dart';
import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/pages/add_clients_page/add_client_viewmodel.dart';
import 'package:DummyInvoice/widgets/text_form_fields_mandatory.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddClientsPage extends StatefulWidget {
  const AddClientsPage({super.key});

  @override
  State<AddClientsPage> createState() => _AddClientsPageState();
}

class _AddClientsPageState extends State<AddClientsPage> {
  bool isToggled = false;
  final formKey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    AddClientViewmodel addClientViewmodel = AddClientViewmodel();
    HomePageViewmodel homePageViewmodel = HomePageViewmodel();
    final clientPageViewmodel=context.watch<ClientPageViewmodel>();
    bool isDark = Theme.of(context).brightness == Brightness.dark;



    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            selected_page_notifier.value ==2?selected_page_notifier.value=0:Navigator.pop(context);

          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: homePageViewmodel.getTextColor(isDark),
          ),
        ),
        backgroundColor: homePageViewmodel.getBackColor(isDark),
        scrolledUnderElevation: 0,
        title: Text(
          addClientViewmodel.appBarTitle,
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
              left: homePageViewmodel.getWidth(context, 20),
              right: homePageViewmodel.getWidth(context, 20),
              bottom: homePageViewmodel.getWidth(context, 20),
            ),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormFieldsMandatory(
                    labelText: addClientViewmodel.firstNameLabel,
                    hintText: addClientViewmodel.firstName,
                    isMandatory: true,
                    controller: clientPageViewmodel.firstNameController,
                    maxLength: 40,
                    validator: (p0) =>clientPageViewmodel.nameValidator(p0),
                      inputFormatter:FilteringTextInputFormatter.allow(RegExp(r'[a-zA-z]'))


                  ),
                  TextFormFieldsMandatory(
                    labelText: addClientViewmodel.lastNameLabel,
                    hintText: addClientViewmodel.lastName,
                    isMandatory: true,
                    maxLength: 40,
                    controller: clientPageViewmodel.lastNameController,
                    validator: (p0) =>clientPageViewmodel.nameValidator(p0),
                      inputFormatter:FilteringTextInputFormatter.allow(RegExp(r'[a-zA-z]'))
                  ),
                  TextFormFieldsMandatory(
                    labelText: addClientViewmodel.emailAddress,
                    hintText: addClientViewmodel.emailAddressHint,
                    isMandatory: false,
                    controller: clientPageViewmodel.emailController,
                    textInputType: TextInputType.emailAddress,
                    maxLength: 70,
                    validator: (p0) =>clientPageViewmodel.emailValidator(p0),
                  ),
                  TextFormFieldsMandatory(
                    labelText: addClientViewmodel.phoneNo,
                    hintText: addClientViewmodel.phoneNoHint,
                    isMandatory: true,
                    controller: clientPageViewmodel.phoneController,
                    textInputType: TextInputType.phone,
                    validator: (p0) => clientPageViewmodel.phoneValidator(p0),
                    maxLength: 11,

                  ),
                  TextFormFieldsMandatory(
                    labelText: addClientViewmodel.address,
                    hintText: addClientViewmodel.addressHint,
                    isMandatory: false,
                    controller: clientPageViewmodel.addressController,
                    textInputType: TextInputType.text,
                    maxLength: 70,

                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        addClientViewmodel.saveClientButtonText,
                        style: TextStyle(
                          fontFamily: 'Biennale',
                          fontSize: 14,
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
                    width: homePageViewmodel.getWidth(context, 187),
                    height: 50,
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
                      onPressed: () async{
                        if(formKey.currentState!.validate())
                        {

                          clientPageViewmodel.addClient();
                        selected_page_notifier.value==2?selected_page_notifier.value=0:Navigator.pop(context);

                        }
                        else
                          {

                          }
                         },
                      child: Text(
                        addClientViewmodel.addButtonText,
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
      ),
    );

  }

  }

