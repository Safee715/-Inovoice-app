import 'package:DummyInvoice/pages/profile_page/viewmodel/profile_page_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class ViewProfileViewmodel extends ChangeNotifier{

  final TextEditingController idController =
  TextEditingController();
  final TextEditingController nameController =
  TextEditingController();
  final TextEditingController emailController =
  TextEditingController();

  void getControllerText(
      ProfilePageViewmodel profilePageViewmodel,
      int id
      ) async{

    final profile=await profilePageViewmodel.getProfile(id);
    idController.text = profile.userId.toString();
    nameController.text = profile.name.toString();
    emailController.text = profile.email.toString();
  }
  @override
  void dispose() {
    idController.dispose();
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
