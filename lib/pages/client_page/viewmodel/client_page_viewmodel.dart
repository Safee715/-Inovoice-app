import 'package:DummyInvoice/data/notifiers.dart';
import 'package:DummyInvoice/main.dart';
import 'package:DummyInvoice/pages/client_page/model/clients_page_model.dart';
import 'package:DummyInvoice/pages/client_page/repo/clients_page_repo.dart';
import 'package:flutter/material.dart';

class ClientPageViewmodel extends ChangeNotifier {
  ClientPageViewmodel(
    this.context,
      this.clientsPageRepo,
  );
  final context;
  final  ClientsPageRepo clientsPageRepo;
  ValueNotifier<List<Client>> client =
      ValueNotifier<List<Client>>([]);
  final TextEditingController
  firstNameController = TextEditingController();
  final TextEditingController lastNameController =
      TextEditingController();
  final TextEditingController emailController =
      TextEditingController();
  final TextEditingController phoneController =
      TextEditingController();
  final TextEditingController addressController =
      TextEditingController();

  void addClient() async {
    await clientsPageRepo.openDb();
    await clientsPageRepo.insertClient(
      Client(
        firstName: firstNameController.text,
        lastname: lastNameController.text,
        email: emailController.text,
        phoneNo: phoneController.text,
        address: addressController.text,
      ),
    );

    notifyListeners();
  }

  void getClients() async {
    await clientsPageRepo.openDb();
client.value=await clientsPageRepo.getAllClients();
  }

  void delete_Client(int id) async {
    await clientsPageRepo.openDb();
    clientsPageRepo.deleteClient(id);
    notifyListeners();
  }

  Future<void> editClient(
    int id, {
    required String newFirstName,
    required String newLastName,
    required String newEmailAddress,
    required String newPhoneNo,
    required String newAddress,
  }) async {
    await clientsPageRepo.openDb();
    await clientsPageRepo.updateClient(
      Client(id: id,
        firstName: newFirstName,
        lastname: newLastName,
        email: newEmailAddress,
        phoneNo: newPhoneNo,
        address: newAddress,
      ),
    );
    client.value[id]=Client(
      id: id,
        firstName: newFirstName,
        lastname: newLastName,
        email: newEmailAddress,
        phoneNo: newPhoneNo,
        address: newAddress);
    client.value=[...client.value];
    clearControllers();
    notifyListeners();
  }

  void clearControllers() {
    firstNameController.clear();
    lastNameController.clear();
    phoneController.clear();
    emailController.clear();
    addressController.clear();
  }



  void backButtonFunction() {
    selected_page_notifier.value = 0;
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

  String? emailValidator(String? value) {
    if ((value == null) || (value.isEmpty)) {
      return null;
    } else if (!RegExp(
      r'^[\w.-]+@([\w-]+\.)+[\w.-]{2,4}$',
    ).hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }
RegExp getRegExp()
{
  switch(deviceLang)
  {
    case 'en':
      return RegExp(r'^[a-zA-Z0-9\s.,-]*$');
    case 'ur':
      return RegExp(r'^[\u0600-\u06FF0-9\s.,-]*$');
    case 'fr':
    case 'es':
    case 'tr':
      return RegExp(r'^[a-zA-Z0-9\s.,-\u00C0-\u00FF\u0100-\u024F]*$');
    case 'zh':
      return RegExp(r'^[\u4E00-\u9FFF\u3400-\u4DBF0-9\s.,-]*$');
    default :
      return RegExp(r'.*');
  }
}

  String? nameValidator(String? value) {

    if ((value == null) || (value.isEmpty)) {
      return 'Please Enter Name';
    } else if (!getRegExp()
    .hasMatch(value)) {
      return 'Enter a valid Name';
    }
    return null;
  }

  String? phoneValidator(String? value) {
    if ((value == null) || (value.isEmpty)) {
      return 'Please Enter Phone Number';
    } else if (!RegExp(
      r'[0-9 ]',
    ).hasMatch(value)) {
      return 'Enter a valid Phone';
    }
    return null;
  }
}
