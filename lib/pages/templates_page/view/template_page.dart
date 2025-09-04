import 'package:DummyInvoice/data/helpers/common_functions.dart';
import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/pages/templates_page/view/abstract_template.dart';
import 'package:DummyInvoice/pages/templates_page/viewmodel/templates_page_viewmodel.dart';

class TemplatePage extends StatefulWidget {
  const TemplatePage({super.key,required this.constants});
  final Constants constants;

  @override
  State<TemplatePage> createState() =>
      _TemplatePageState();
}

class _TemplatePageState
    extends State<TemplatePage> {
  CommonFunctions commonFunctions=CommonFunctions();
  @override
  Widget build(BuildContext context) {
    TemplatesPageViewmodel
    templatesPageViewmodel =
        TemplatesPageViewmodel();


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFE7EBF2),
        leading: IconButton(
          onPressed: ()
          {
            commonFunctions.backButtonForSubNavigationPages(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
          ),
        ),
        title: Text(widget.constants.templatePageAppBarTitle,

          style: TextStyle(
            fontSize: 24,
            color: Theme.of(context).getTextColor(),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceAround,
                  children: [
                    RectangularTemplate(
                      id: templatesPageViewmodel
                          .ids
                          .elementAt(0),
                      name: templatesPageViewmodel
                          .names
                          .elementAt(0),
                      amount:
                          templatesPageViewmodel
                              .amounts
                              .elementAt(0),
                      boxcolor: Colors.white,
                      textcolor: Colors.black,
                    ),
                    RectangularTemplate(
                      id: templatesPageViewmodel
                          .ids
                          .elementAt(0),
                      name: templatesPageViewmodel
                          .names
                          .elementAt(0),
                      amount:
                          templatesPageViewmodel
                              .amounts
                              .elementAt(0),
                      boxcolor: Colors.grey,
                      textcolor: Colors.black,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceAround,
                  children: [
                    DesignedTemplate(
                      id: templatesPageViewmodel
                          .ids
                          .elementAt(2),
                      name: templatesPageViewmodel
                          .names
                          .elementAt(2),
                      amount:
                          templatesPageViewmodel
                              .amounts
                              .elementAt(2),
                      boxcolor: Colors.white,
                      textcolor: Colors.black,
                    ),
                    DesignedTemplate(
                      id: templatesPageViewmodel
                          .ids
                          .elementAt(3),
                      name: templatesPageViewmodel
                          .names
                          .elementAt(3),
                      amount:
                          templatesPageViewmodel
                              .amounts
                              .elementAt(3),
                      boxcolor: Colors.grey,
                      textcolor: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
