import 'package:flutter/material.dart';
import 'package:invoiceapp/pages/add_clients_page/add_client_viewmodel.dart';
import 'package:invoiceapp/widgets/text_form_fields_mandatory.dart';
import 'package:invoiceapp/widgets/text_form_fields_widget.dart';

class AddClientsPage extends StatefulWidget {
  const AddClientsPage({super.key});


  @override
  State<AddClientsPage> createState() => _AddClientsPageState();
}

class _AddClientsPageState extends State<AddClientsPage> {
   bool _toggeled=false;
  @override
  Widget build(BuildContext context) {
    AddClientViewmodel a1=AddClientViewmodel();
    return Scaffold(
appBar: AppBar(backgroundColor: Color(0xFE7EBF2),
  leading: IconButton(
    onPressed: () {
      Navigator.pop(context);
    },
    icon: Icon(Icons.arrow_back_ios_outlined),
  ),
  title: Text(a1.appBarTitle,
    style:TextStyle(fontWeight: FontWeight.bold,fontSize: 24) ,),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormFieldsMandatory(labelText: a1.firstNameLabel,
                hintText: a1.firstName,),
              TextFormFieldsMandatory(labelText:a1.lastNameLabel,
                  hintText: a1.lastName),
              TextFormFieldsWidget(
                  labelText:a1.emailAddress,
                  hintText:a1.emailAddressHint),
              TextFormFieldsMandatory(
                  labelText:a1.phoneNo,
                  hintText: a1.phoneNoHint),
              TextFormFieldsWidget(
                  labelText: a1.address,
                  hintText: a1.addressHint),

              SizedBox(height: 30,),
              SwitchListTile(title: Text(a1.saveClientButtonText),activeColor: Color(0xff4F94FB),
                value:_toggeled ,thumbColor: WidgetStatePropertyAll(Color(0xffFFFFFF)),
                  onChanged:
                  (bool value) {
                  setState(() {
                    _toggeled=value;
                  });
                  },
              ),
              SizedBox(height: 20,),
              Container(width: 187,height: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  colors: [Color(0xFF9CD9FF),Color(0xFF4082E3)
              ],),),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,shadowColor: Colors.transparent),
                    onPressed: (){},
                    child: Text(a1.addButtonText,
                      style:TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold) ,)),
              )



            ],
          ),


          ),
        ),
    );
  }
}
