import 'package:flutter/material.dart';
import 'package:DummyInvoice/pages/add_clients_page/add_client_viewmodel.dart';
import 'package:DummyInvoice/widgets/text_form_fields_mandatory.dart';
import 'package:DummyInvoice/widgets/text_form_fields_widget.dart';

class AddClientsPage extends StatefulWidget {
  const AddClientsPage({super.key});

  @override
  State<AddClientsPage> createState() => _AddClientsPageState();
}

class _AddClientsPageState extends State<AddClientsPage> {
  bool _toggeled = false;
  @override
  Widget build(BuildContext context) {
    AddClientViewmodel addClientViewmodel = AddClientViewmodel();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFE7EBF2),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_outlined),
        ),
        title: Text(
          addClientViewmodel.appBarTitle,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormFieldsMandatory(
                labelText: addClientViewmodel.firstNameLabel,
                hintText: addClientViewmodel.firstName,
              ),
              TextFormFieldsMandatory(
                labelText: addClientViewmodel.lastNameLabel,
                hintText: addClientViewmodel.lastName,
              ),
              TextFormFieldsWidget(
                labelText: addClientViewmodel.emailAddress,
                hintText: addClientViewmodel.emailAddressHint,
              ),
              TextFormFieldsMandatory(
                labelText: addClientViewmodel.phoneNo,
                hintText: addClientViewmodel.phoneNoHint,
              ),
              TextFormFieldsWidget(
                labelText: addClientViewmodel.address,
                hintText: addClientViewmodel.addressHint,
              ),

              SizedBox(height: 30),
              SwitchListTile(
                title: Text(addClientViewmodel.saveClientButtonText),
                activeColor: Color(0xff4F94FB),
                value: _toggeled,
                thumbColor: WidgetStatePropertyAll(Color(0xffFFFFFF)),
                onChanged: (bool value) {
                  setState(() {
                    _toggeled = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Container(
                width: 187,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    colors: [Color(0xFF9CD9FF), Color(0xFF4082E3)],
                  ),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {},
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
    );
  }
}
