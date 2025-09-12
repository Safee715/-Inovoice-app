import 'package:DummyInvoice/pages/profile_page/viewmodel/profile_page_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class EditProfileViewmodel extends ChangeNotifier{


  final TextEditingController idController =
  TextEditingController();
  final TextEditingController nameController =
  TextEditingController();
  final TextEditingController emailController =
  TextEditingController();

  void getControllerText(
      ProfilePageViewmodel profilePageViewmodel,
      String id
      ) async{

    final profile=await profilePageViewmodel.getProfile(id);

    if (profile!=null) {
      idController.text     = profile.userId.toString();
      nameController.text   = profile.name.toString();
      emailController.text  = profile.email.toString();
    }
    else
      {

      }

  }
  @override
  void dispose() {
    idController.dispose();
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
