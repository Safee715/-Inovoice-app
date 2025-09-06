import 'package:flutter/cupertino.dart';

class AddClientViewmodel extends ChangeNotifier{
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

  void clearControllers() {
    firstNameController.clear();
    lastNameController.clear();
    phoneController.clear();
    emailController.clear();
    addressController.clear();

  }


}