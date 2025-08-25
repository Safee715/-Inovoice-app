import 'package:DummyInvoice/pages/client_page/viewmodel/client_page_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class EditClientViewmodel {
  final appBarTitle = 'Edit Details';
  final firstNameLabel = 'First Name';
  final lastNameLabel = 'Last Name';
  final emailAddress = 'Email Address';
  final phoneNo = 'Phone Number';
  final address = 'Address';
  final saveClientButtonText =
      'Save to Client Lists';
  final addButtonText = 'Save Changes';
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

  void getControllerText(
    ClientPageViewmodel clientPageViewmodel,
    int id,
  ) {
    final client = clientPageViewmodel
        .client
        .value
        .elementAt(id);
    firstNameController.text = client.firstName;
    lastNameController.text = client.lastname;
    emailController.text = client.email;
    phoneController.text = client.phoneNo;
    addressController.text = client.address;
  }

  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
  }
}
