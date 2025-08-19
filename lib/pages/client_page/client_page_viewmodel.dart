import 'package:DummyInvoice/data/notifiers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ClientPageViewmodel extends ChangeNotifier {



  ClientPageViewmodel({

    this.context
  })
  {
    loadClients();
  }
  final context;
 ValueNotifier< List<String>> firstNames=ValueNotifier([]);
 ValueNotifier< List<String>> lastNames=ValueNotifier([]);
 ValueNotifier< List<String>> emails=ValueNotifier([]);
 ValueNotifier< List<String>> phoneNos=ValueNotifier([]);
 ValueNotifier< List<String>> addresses=ValueNotifier([]);
 final TextEditingController firstNameController = TextEditingController();
 final TextEditingController lastNameController = TextEditingController();
 final TextEditingController emailController = TextEditingController();
 final TextEditingController phoneController = TextEditingController();
 final TextEditingController addressController = TextEditingController();
 void loadClients()async
 {
   final prefs=await SharedPreferences.getInstance();
   final clientFirstNames=prefs.getStringList('firstNames')??[];
   final clientLastNames=prefs.getStringList('lastNames')??[];
   final clientEmails=prefs.getStringList('emails')??[];
   final clientPhoneNos=prefs.getStringList('phoneNos')??[];
   final clientAddresses=prefs.getStringList('addresses')??[];
   firstNames.value=clientFirstNames;
   lastNames.value=clientLastNames;
   emails.value=clientEmails;
   addresses.value=clientAddresses;
   phoneNos.value=clientPhoneNos;
   // print("Loaded names: $clientNames");
   // print("Loaded emails: $clientEmails");
   // print("CLoaded names: ${names}");
   // print("CLoaded emails: ${emails}");
   // clearControllers();
notifyListeners();
 }
 void deleteClient(int id)async
 {
   final SharedPreferences preferences=await SharedPreferences.getInstance();
   final clientFirstNames=preferences.getStringList('firstNames')??[];
   final clientLastNames=preferences.getStringList('lastNames')??[];
   final clientEmails=preferences.getStringList('emails')??[];
   final clientAddresses=preferences.getStringList('addresses')??[];
   final clientPhoneNos=preferences.getStringList('phoneNos')??[];
   if(id<clientFirstNames.length)
   {
      clientFirstNames.removeAt(id);
    }if(id<clientLastNames.length)
   {
      clientLastNames.removeAt(id);
    }if(id<clientPhoneNos.length)
   {
      clientPhoneNos.removeAt(id);
    }if(id<clientAddresses.length)
   {
      clientAddresses.removeAt(id);
    }
    if(id<clientEmails.length)
   {
      clientEmails.removeAt(id);
    }
    firstNames.value=List.from(clientFirstNames);
    lastNames.value=List.from(clientLastNames);
   emails.value=List.from(clientEmails);
   addresses.value=List.from(clientAddresses);
   phoneNos.value=List.from(clientPhoneNos);
   preferences.setStringList('firstNames',clientFirstNames );
   preferences.setStringList('lastNames',clientLastNames );
   preferences.setStringList('emails',clientEmails );
   preferences.setStringList('addresses',clientAddresses );
   preferences.setStringList('phoneNos',clientPhoneNos );
   // print("after names: ${names}");
   // print("after emails: ${emails}");
notifyListeners();

 }
 Future <void> addClient() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   final first = firstNameController.text.trim();
   final last = lastNameController.text.trim();
   final email = emailController.text.trim();
   final phone = phoneController.text.trim();
   final address = addressController.text.trim();
   if (first.isEmpty || last.isEmpty||phone.isEmpty||address.isEmpty||email.isEmpty) {
     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text('Please fill out mandatory fields')),
     );
     return;
   }
   final clientFirstNames=prefs.getStringList('firstNames')??[];
   final clientLastNames=prefs.getStringList('lastNames')??[];
   final clientEmails=prefs.getStringList('emails')??[];
   final clientAddresses=prefs.getStringList('addresses')??[];
   final clientPhoneNos=prefs.getStringList('phoneNos')??[];
   clientFirstNames.add(first);
   clientLastNames.add(last);
   clientEmails.add(email);
   clientAddresses.add(address);
   clientPhoneNos.add(phone);

   firstNames.value=List.from(clientFirstNames);
   lastNames.value=List.from(clientLastNames);
   emails.value=List.from(clientEmails);
   addresses.value=List.from(clientAddresses);
   phoneNos.value=List.from(clientPhoneNos);

   prefs.setStringList('firstNames',clientFirstNames );
   prefs.setStringList('lastNames',clientLastNames );
   prefs.setStringList('emails',clientEmails );
   prefs.setStringList('addresses',clientAddresses );
   prefs.setStringList('phoneNos',clientPhoneNos );
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
    final clientFirstNames=prefs.getStringList('firstNames')??[];
    final clientLastNames=prefs.getStringList('lastNames')??[];
    final clientEmails=prefs.getStringList('emails')??[];
    final clientAddresses=prefs.getStringList('addresses')??[];
    final clientPhoneNos=prefs.getStringList('phoneNos')??[];
    clientFirstNames[id]=newFirstName;
    clientLastNames[id]=newLastName;
    clientEmails[id]=newEmailAddress;
    clientPhoneNos[id]=newPhoneNo;
    clientAddresses[id]=newAddress;
    firstNames.value=List.from(clientFirstNames);
    lastNames.value=List.from(clientLastNames);
    emails.value=List.from(clientEmails);
    addresses.value=List.from(clientAddresses);
    phoneNos.value=List.from(clientPhoneNos);


    prefs.setStringList('firstNames',clientFirstNames );
    prefs.setStringList('lastNames',clientLastNames );
    prefs.setStringList('emails',clientEmails );
    prefs.setStringList('addresses',clientAddresses );
    prefs.setStringList('phoneNos',clientPhoneNos );
    clearControllers();
  notifyListeners();
  // print('new $newFirstName');
  // print('new $newEmailAddress');



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
    firstNames.dispose();
    lastNames.dispose();
    emails.dispose();
    phoneNos.dispose();
    addresses.dispose();
    super.dispose();
  }

}
