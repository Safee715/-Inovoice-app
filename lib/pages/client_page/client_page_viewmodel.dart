import 'dart:convert';

import 'package:DummyInvoice/data/notifiers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Client
{
  String firstName;
  String lastname;
  String email;
  String phoneNo;
  String address;
  Client({required this.firstName,
    required this.lastname,
    required this.email,
    required this.phoneNo,
    required this.address
  });


  Map<String, dynamic>toJson()=>
      {
        'firstName':firstName,
        'lastname':lastname,
        'email':email,
        'phoneNo':phoneNo,
        'address':address,
      };
factory Client.fromJson(Map<String ,dynamic>json)=>
    Client(firstName: json['firstName'],
        lastname: json['lastname'],
        email: json['email'],
        phoneNo: json['phoneNo'],
        address: json['address']
    );

}

class ClientPageViewmodel extends ChangeNotifier {



  ClientPageViewmodel({

    this.context
  })
  {
    getClients();
  }
  final context;

 ValueNotifier< List<Client>> client=ValueNotifier([]);
 final TextEditingController firstNameController = TextEditingController();
 final TextEditingController lastNameController = TextEditingController();
 final TextEditingController emailController = TextEditingController();
 final TextEditingController phoneController = TextEditingController();
 final TextEditingController addressController = TextEditingController();

 void saveClient(List<Client> clientObject)async
 {
   final SharedPreferences prefs=await SharedPreferences.getInstance();
   List<String> clientString=clientObject.map((e) => jsonEncode(e.toJson())).toList();
   List<String> savedStrings= prefs.getStringList('client')??[];
   List<String> updatedList=savedStrings+clientString;
await prefs.setStringList('client', updatedList);
List<Client> savedObjects=updatedList.map((str) => Client.fromJson(jsonDecode(str) as Map<String ,dynamic>)).toList();

client.value=savedObjects;

notifyListeners();
 }


 void getClients()async
 {

   final SharedPreferences prefs=await SharedPreferences.getInstance();
   List<String> stringLists=prefs.getStringList('client')??[];
   List<Client> savedClients=stringLists.map((e) => Client.fromJson(jsonDecode(e) as Map<String,dynamic>)).toList();

   client.value=List.from(savedClients);
   notifyListeners();

 }




 void delete_Client(int id)async
 {
   final SharedPreferences prefs=await SharedPreferences.getInstance();
   List<String> savedStrings=prefs.getStringList('client')??[];
   savedStrings.removeAt(id);
   prefs.setStringList('client',savedStrings);
   List<Client> listOfClients=savedStrings.map((e) => Client.fromJson(jsonDecode(e)as Map<String,dynamic>)).toList();
   client.value=List.from(listOfClients);
   notifyListeners();
 }

 Future <void> addClient() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   final first = firstNameController.text.trim();
   final last = lastNameController.text.trim();
   final email = emailController.text.trim();
   final phone = phoneController.text.trim();
   final address = addressController.text.trim();


   final savedStrings=prefs.getStringList('client')??[];

   final savedClients=savedStrings.map((e) => Client.fromJson(jsonDecode(e)as Map<String,dynamic>)).toList();
   savedClients.add(Client(firstName: first, lastname: last, email: email, phoneNo: phone, address: address));
   
   client.value=List.from(savedClients);
   List<String> newList=savedClients.map((e) => jsonEncode(e.toJson())).toList();
   prefs.setStringList('client', newList);

notifyListeners();
 }
  Future <void> editClient(
      int id,
      {required  newFirstName,
        required  newLastName,
        required  newEmailAddress,
        required  newPhoneNo,
        required  newAddress
      }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final savedStrings=prefs.getStringList('client')??[];


    List<Client> savedClients=savedStrings.map((e) => Client.fromJson(jsonDecode(e)as Map<String,dynamic>)).toList();
    savedClients.elementAt(id).firstName=newFirstName;
    savedClients.elementAt(id).lastname=newLastName;
    savedClients.elementAt(id).email=newEmailAddress;
    savedClients.elementAt(id).address=newAddress;
    savedClients.elementAt(id).phoneNo=newPhoneNo;
List<String> newStrings=savedClients.map((e) => jsonEncode(e.toJson())).toList();
prefs.setStringList('client', newStrings);
client.value=List.from(savedClients);

    clearControllers();
  notifyListeners();




  }
void clearControllers()
{
  firstNameController.clear();
  lastNameController.clear();
  phoneController.clear();
  emailController.clear();
  addressController.clear();
}


final addButtonAddress='assets/images/icons/addclients.svg';
void backButtonFunction()
{
  selected_page_notifier.value=0;

}
@override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    addressController.dispose();
    phoneController.dispose();
    super.dispose();
  }
String ?emailValidator(String? value)
{  if ((value == null) || (value.isEmpty)) {
  return null;
}
  else if(!RegExp(r'^[\w.-]+@([\w-]+\.)+[\w.-]{2,4}$').hasMatch(value))
  {
  return 'Enter a valid email';
  }
return null;
}
  String ?nameValidator(String? value)
  {  if ((value == null) || (value.isEmpty)) {
    return 'Please Enter Name';
  }
    else if(!RegExp(r'^[a-zA-Z ]+$').hasMatch(value))
    {
      return 'Enter a valid Name';
    }
    return null;
  }
  String ?phoneValidator(String? value)
  {  if ((value == null) || (value.isEmpty)) {
    return 'Please Enter Phone Number';
  }
  else if(!RegExp(r'^(?:[+0]9)?[0-9\s]{10-12}$').hasMatch(value))
  {
    return 'Enter a valid Phone';
  }
  return null;
  }


}
