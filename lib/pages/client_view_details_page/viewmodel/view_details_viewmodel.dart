import 'package:DummyInvoice/pages/client_page/viewmodel/client_page_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class ViewDetailsViewmodel {
  ViewDetailsViewmodel({required this.id});
  final int id;

  final appBarTitle = 'Client Details';
  final firstNameLabel = 'First Name';
  final lastNameLabel = 'Last Name';
  final emailAddress = 'Email Address';
  final phoneNo = 'Phone Number';
  final address = 'Address';

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
  ) {
    final client = clientPageViewmodel
        .client
        .value[id];
    firstNameController.text = client.firstName;
    lastNameController.text = client.lastname;
    emailController.text = client.email;
    phoneController.text = client.phoneNo;
    addressController.text = client.address;
  }
}
