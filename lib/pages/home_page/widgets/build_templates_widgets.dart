import 'package:DummyInvoice/data/notifiers.dart';
import 'package:DummyInvoice/pages/navigation_pages/view/sub_navigation_page.dart';
import 'package:DummyInvoice/pages/templates_page/view/abstract_template.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/pages/templates_page/viewmodel/templates_page_viewmodel.dart';

class BuildTemplatesWidgets extends StatelessWidget {
  const BuildTemplatesWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    TemplatesPageViewmodel templatesPageViewmodel =
    TemplatesPageViewmodel();
      return GestureDetector(
        onTap: (){
          client_page_index.value=0;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  SubNavigationPage(),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceAround,
                children: [
                  RectangularTemplate(
                    id: templatesPageViewmodel.ids
                        .elementAt(0),
                    name: templatesPageViewmodel
                        .names
                        .elementAt(0),
                    amount: templatesPageViewmodel
                        .amounts
                        .elementAt(0),
                    boxcolor: Colors.white,
                    textcolor: Colors.black,
                  ),
                  RectangularTemplate(
                    id: templatesPageViewmodel.ids
                        .elementAt(0),
                    name: templatesPageViewmodel
                        .names
                        .elementAt(0),
                    amount: templatesPageViewmodel
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
                MainAxisAlignment.spaceAround,
                children: [
                  DesignedTemplate(
                    id: templatesPageViewmodel.ids
                        .elementAt(2),
                    name: templatesPageViewmodel
                        .names
                        .elementAt(2),
                    amount: templatesPageViewmodel
                        .amounts
                        .elementAt(2),
                    boxcolor: Colors.white,
                    textcolor: Colors.black,
                  ),
                  DesignedTemplate(
                    id: templatesPageViewmodel.ids
                        .elementAt(3),
                    name: templatesPageViewmodel
                        .names
                        .elementAt(3),
                    amount: templatesPageViewmodel
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
      );

  }
}
