import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/pages/edit_profile_page/viewmodel/editprofileviewmodel.dart';
import 'package:DummyInvoice/pages/profile_page/viewmodel/profile_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/widgets/custom_text_fields.dart';
import 'package:provider/provider.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<ViewProfile> createState() =>
      _EditClient();
}

class _EditClient extends State<ViewProfile> {
  final formKey=GlobalKey<FormState>();
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
                  _buildCustomDetailsFields(constants),

                ],
              ),
            ),
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
          enabled: false,

        ),
        CustomTextFields(
          labelText: constants.idLabel,
          controller:
          editProfileViewmodel.idController,
          isMandatory: true,
          enabled: false,

        ),
        CustomTextFields(
          labelText: constants.titleLabel,
          controller: editProfileViewmodel
              .titleController,
          isMandatory: false,
          maxLength: 70,
          enabled: false,

        ),
        CustomTextFields(
          labelText: constants.bodyLabel,
          controller:
          editProfileViewmodel.bodyController,
          isMandatory: false,
          maxLength: 11,
          enabled: false,
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
