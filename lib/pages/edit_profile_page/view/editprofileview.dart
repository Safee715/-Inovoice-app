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

  final String id;

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

    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Theme.of(
        context,
      ).getBackColor(),
      body: _buildBody(),
    );
  }
PreferredSizeWidget _buildAppBar()
{
  Constants constants = Constants();
  return AppBar(
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
  );
}
  Widget _buildBody()
{     Constants constants = Constants();
return SafeArea(
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
              const SizedBox(height: 20),
              _buildSaveButton(),
            ],
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
        gradient: const LinearGradient(
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
              widget.id,
              Profile(
                userId:
                    int.tryParse(
                      editProfileViewmodel
                          .idController
                          .text
                          .trim(),
                    ) ??
                    0,
                name: editProfileViewmodel
                    .nameController
                    .text,
                email: editProfileViewmodel
                    .emailController
                    .text,
              ),
            );
            Navigator.pop(context);
          }
        },
        child: const Text(
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
  )
  {
    final editProfileViewmodel = context
        .watch<EditProfileViewmodel>();
    return Column(
      children: [
        CustomTextFields(
          labelText: constants.idLabel,
          controller:
              editProfileViewmodel.idController,
          isMandatory: true,
        ),
        CustomTextFields(
          labelText: constants.nameLabel,
          controller:
              editProfileViewmodel.nameController,
          isMandatory: false,
          maxLength: 70,
        ),
        CustomTextFields(
          labelText: constants.emailLabel,
          controller: editProfileViewmodel
              .emailController,
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
