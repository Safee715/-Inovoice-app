import 'package:flutter/cupertino.dart';

class AddProfileViewmodel extends ChangeNotifier{
  final TextEditingController
  userIdController = TextEditingController();
  final TextEditingController idController =
  TextEditingController();
  final TextEditingController titleController =
  TextEditingController();
  final TextEditingController bodyController =
  TextEditingController();


  void clearControllers() {
    userIdController.clear();
    idController.clear();
    titleController.clear();
    bodyController.clear();

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