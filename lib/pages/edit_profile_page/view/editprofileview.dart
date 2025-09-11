import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/pages/edit_profile_page/viewmodel/editprofileviewmodel.dart';
import 'package:DummyInvoice/pages/profile_page/model/profile.dart';
import 'package:DummyInvoice/pages/profile_page/viewmodel/profile_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/widgets/custom_text_fields.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<EditProfile> createState() =>
      _EditClient();
}

class _EditClient extends State<EditProfile> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final profilePageViewmodel = context
        .read<ProfilePageViewmodel>();
    final editProfileViewmodel = context
        .read<EditProfileViewmodel>();
    editProfileViewmodel.getControllerText(
      profilePageViewmodel,
      widget.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    Constants constants = Constants();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(
          context,
        ).getBackColor(),
        scrolledUnderElevation: 0,
        title: Text(
          constants.editProfileAppbarTitle,
          style: TextStyle(
            color: Theme.of(
              context,
            ).getTextColor(),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(
        context,
      ).getBackColor(),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: context.getWidth(20),
              right: context.getWidth(20),
              bottom: context.getWidth(20),
            ),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  _buildCustomDetailsFields(
                    constants,
                  ),
                  SizedBox(height: 20),
                  _buildSaveButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    final profilePageViewmodel = context
        .watch<ProfilePageViewmodel>();
    final editProfileViewmodel = context
        .watch<EditProfileViewmodel>();

    return Container(
      width: context.getWidth(297),
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        gradient: LinearGradient(
          colors: [
            Color(0xFF9CD9FF),
            Color(0xFF4082E3),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            profilePageViewmodel.editProfile(
              int.tryParse(editProfileViewmodel.userIdController.text.trim())??0,
              Profile(
                userId:int.tryParse(editProfileViewmodel.userIdController.text.trim())??0,
                id: int.tryParse(editProfileViewmodel.idController.text.trim())??0,
                title: editProfileViewmodel
                    .titleController
                    .text,
                body: editProfileViewmodel
                    .bodyController
                    .text,
              ),
            );
            Navigator.pop(context);
          }
        },
        child: Text(
          'Edit',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCustomDetailsFields(
    Constants constants,
  ) {
    final editProfileViewmodel = context
        .watch<EditProfileViewmodel>();
    return Column(
      children: [
        CustomTextFields(
          labelText: constants.userIdLabel,
          controller: editProfileViewmodel
              .userIdController,
          isMandatory: true,
          maxLength: 40,
        ),
        CustomTextFields(
          labelText: constants.idLabel,
          controller:
              editProfileViewmodel.idController,
          isMandatory: true,
        ),
        CustomTextFields(
          labelText: constants.titleLabel,
          controller: editProfileViewmodel
              .titleController,
          isMandatory: false,
          maxLength: 70,
        ),
        CustomTextFields(
          labelText: constants.bodyLabel,
          controller:
              editProfileViewmodel.bodyController,
          isMandatory: false,
          maxLength: 11,
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
