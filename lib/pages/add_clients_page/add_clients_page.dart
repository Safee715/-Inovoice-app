import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/data/notifiers.dart';
import 'package:DummyInvoice/pages/client_page/client_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/widgets/custom_text_fields.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddClientsPage extends StatefulWidget {
  const AddClientsPage({super.key});

  @override
  State<AddClientsPage> createState() =>
      _AddClientsPageState();
}

class _AddClientsPageState
    extends State<AddClientsPage> {
  final formKey = GlobalKey<FormState>();
  Constants constants = Constants(
    addButtonText: 'Add',
  );

  @override
  Widget build(BuildContext context) {
    final clientPageViewmodel = context
        .watch<ClientPageViewmodel>();

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
          constants.addClientAppBarTitle,
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
                  CustomTextFields(
                    labelText:
                        constants.firstNameLabel,
                    hintText: constants.firstName,
                    isMandatory: true,
                    controller:
                        clientPageViewmodel
                            .firstNameController,
                    maxLength: 40,
                    validator: (p0) =>
                        clientPageViewmodel
                            .nameValidator(p0),
                    inputFormatter:
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[a-zA-Z- ]'),
                        ),
                  ),
                  CustomTextFields(
                    labelText:
                        constants.lastNameLabel,
                    hintText: constants.lastName,
                    isMandatory: true,
                    maxLength: 40,
                    controller:
                        clientPageViewmodel
                            .lastNameController,
                    validator: (p0) =>
                        clientPageViewmodel
                            .nameValidator(p0),
                    inputFormatter:
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[a-zA-Z- ]'),
                        ),
                  ),
                  CustomTextFields(
                    labelText:
                        constants.emailAddress,
                    hintText: constants
                        .emailAddressHint,
                    isMandatory: false,
                    controller:
                        clientPageViewmodel
                            .emailController,
                    textInputType: TextInputType
                        .emailAddress,
                    maxLength: 70,
                    validator: (p0) =>
                        clientPageViewmodel
                            .emailValidator(p0),
                  ),
                  CustomTextFields(
                    labelText: constants.phoneNo,
                    hintText:
                        constants.phoneNoHint,
                    isMandatory: true,
                    controller:
                        clientPageViewmodel
                            .phoneController,
                    textInputType:
                        TextInputType.phone,
                    maxLength: 11,validator: (p0) => clientPageViewmodel.phoneValidator(p0),
                    inputFormatter:
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[0-9]+'),
                        ),
                  ),
                  CustomTextFields(
                    labelText: constants.address,
                    hintText:
                        constants.addressHint,
                    isMandatory: false,
                    controller:
                        clientPageViewmodel
                            .addressController,
                    textInputType:
                        TextInputType.text,
                    maxLength: 70,
                    inputFormatter:
                        FilteringTextInputFormatter.allow(
                          RegExp(
                            r'[a-zA-Z- 0-9]',
                          ),
                        ),
                  ),
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
                  Container(
                    width: context.getWidth(187),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(
                            5.0,
                          ),
                      gradient: constants.gradient,
                    ),
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors
                                    .transparent,
                            shadowColor: Colors
                                .transparent,
                          ),
                      onPressed: () async {
                        if (formKey.currentState!
                            .validate()) {
                          clientPageViewmodel
                              .addClient();
                          selected_page_notifier
                                      .value ==
                                  2
                              ? selected_page_notifier
                                        .value =
                                    0
                              : Navigator.pop(
                                  context,
                                );
                        } else {}
                      },
                      child: Text(
                        constants
                            .getElevatedButtonText(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
