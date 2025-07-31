import 'package:flutter/material.dart';
// import 'package:invoiceapp/data/notifiers.dart';
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
    return Scaffold(
appBar: AppBar(backgroundColor: Color(0xFE7EBF2),
  leading: IconButton(
    onPressed: () {
      Navigator.pop(context);
    },
    icon: Icon(Icons.arrow_back_ios_outlined),
  ),
  title: Text('Add Client',
    style:TextStyle(fontWeight: FontWeight.bold,fontSize: 24) ,),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormFieldsMandatory(labelText: 'First Name', hintText: 'Tommy'),
              TextFormFieldsMandatory(labelText: 'Last Name', hintText: 'Hope'),
              TextFormFieldsWidget(labelText: 'Email Address', hintText: 'jhonjames@gmail.com'),
              TextFormFieldsMandatory(labelText: 'Phone Number', hintText: '+966 6599 56587'),
              TextFormFieldsWidget(labelText: 'Address', hintText: 'London west street No (57)'),

              SizedBox(height: 30,),
              SwitchListTile(title: Text('Save to Client Lists'),activeColor: Color(0xff4F94FB),
                value:_toggeled ,
                  onChanged:
                  (bool value) {
                  setState(() {
                    _toggeled=value;
                  });
                  },
              ),
              SizedBox(height: 20,),
              Container(width: 187,height: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
                gradient: LinearGradient(
                  colors: [Color(0xFF9CD9FF),Color(0xFF4082E3)
              ],),),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,shadowColor: Colors.transparent),
                    onPressed: (){},
                    child: Text('Add',
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
