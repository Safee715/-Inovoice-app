import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/data/languages/language_manager.dart';
import 'package:DummyInvoice/data/notifiers.dart';
import 'package:DummyInvoice/pages/add_profile_page/viewmodel/addprofileviewmodel.dart';
import 'package:DummyInvoice/pages/profile_page/model/profile.dart';
import 'package:DummyInvoice/pages/profile_page/viewmodel/profile_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/widgets/custom_text_fields.dart';
import 'package:provider/provider.dart';

class AddProfilePage extends StatefulWidget {
  const AddProfilePage({super.key});

  @override
  State<AddProfilePage> createState() =>
      _AddProfilePageState();
}

class _AddProfilePageState
    extends State<AddProfilePage> {
  final formKey = GlobalKey<FormState>();
  Constants constants = Constants(
    addButtonText: LanguageManager.translate(
      'Add',
    ),
  );

  @override
  void initState() {
    super.initState();
    final addProfileViewmodel = context
        .read<AddProfileViewmodel>();
    addProfileViewmodel.clearControllers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            selected_page_notifier.value == 2
                ? selected_page_notifier.value = 0
                : Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Theme.of(
              context,
            ).getTextColor(),
          ),
        ),
        backgroundColor: Theme.of(
          context,
        ).getBackColor(),
        scrolledUnderElevation: 0,
        title: Text(
          constants.addProfileAppbarTitle,
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
            child: Column(
              children: [
                _buildCustomTextFields(),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
                  children: [
                    Text(
                      constants
                          .saveClientButtonText,
                      style: TextStyle(
                        fontFamily: 'Biennale',
                        fontSize: 14,
                        color: Theme.of(
                          context,
                        ).getTextColor(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                _buildAddButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomTextFields() {
    final addProfileViewmodel = context
        .watch<AddProfileViewmodel>();

    return Form(
      key:formKey,
      child: Column(
        children: [
          CustomTextFields(
            labelText: constants.idLabel,
            hintText: constants.idHint,
            isMandatory: true,
            maxLength: 40,
            controller: addProfileViewmodel
                .idController,
              validator: (p0) => addProfileViewmodel.idValidator(p0)
          ),
          CustomTextFields(
            labelText: constants.nameLabel,
            hintText: constants.nameHint,
            isMandatory: false,
            controller:
            addProfileViewmodel.nameController,
            maxLength: 70,

          ),
          CustomTextFields(
            labelText: constants.emailLabel,
            hintText: constants.emailHint,
            isMandatory: false,
            controller:
            addProfileViewmodel.emailController,
            maxLength: 100,

          ),

        ],
      ),
    );
  }

  Widget _buildAddButton() {
    final profilePageViewmodel=context.watch<ProfilePageViewmodel>();
    final addProfileViewmodel = context
        .watch<AddProfileViewmodel>();
    return Container(
      width: context.getWidth(187),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        gradient: constants.gradient,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: () async {
          if(formKey.currentState!.validate())
          {
            await profilePageViewmodel.addProfile(
              Profile(
                userId: int.tryParse(addProfileViewmodel.idController.text) ?? 0,
                name: addProfileViewmodel.nameController.text,
                email: addProfileViewmodel.emailController.text,
              ),
            );
            if(!mounted)return;
            Navigator
                .of(context)
                .pop();
          }
          else{}
        },
        child: Text(
          constants.getElevatedButtonText(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
