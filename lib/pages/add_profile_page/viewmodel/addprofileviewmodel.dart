import 'package:flutter/cupertino.dart';

class AddProfileViewmodel extends ChangeNotifier{

  final TextEditingController idController =
  TextEditingController();
  final TextEditingController nameController =
  TextEditingController();
  final TextEditingController emailController =
  TextEditingController();


  void clearControllers() {
    idController.clear();
    nameController.clear();
    emailController.clear();

  }

  String? idValidator(String? value) {
    if ((value == null) || (value.isEmpty)) {
      return 'Please Enter id';
    } else if (!RegExp(
      r'[0-9 ]',
    ).hasMatch(value)) {
      return 'Enter a valid id';
    }
    return null;
  }



}