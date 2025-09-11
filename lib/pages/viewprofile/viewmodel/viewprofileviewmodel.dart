import 'package:DummyInvoice/pages/profile_page/viewmodel/profile_page_viewmodel.dart';
import 'package:flutter/cupertino.dart';

class ViewProfileViewmodel extends ChangeNotifier{

  final TextEditingController
  userIdController = TextEditingController();
  final TextEditingController idController =
  TextEditingController();
  final TextEditingController titleController =
  TextEditingController();
  final TextEditingController bodyController =
  TextEditingController();

  void getControllerText(
      ProfilePageViewmodel profilePageViewmodel,
      int id
      ) async{

    final profile=await profilePageViewmodel.getProfile(id);
    userIdController.text = profile.userId.toString();
    idController.text = profile.id.toString();
    titleController.text = profile.title.toString();
    bodyController.text = profile.body.toString();
  }
  @override
  void dispose() {
    userIdController.dispose();
    idController.dispose();
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }
}
