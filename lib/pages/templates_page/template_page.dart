import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/data/notifiers.dart';
import 'package:DummyInvoice/pages/templates_page/abstract_template.dart';
import 'package:DummyInvoice/pages/templates_page/templates_page_viewmodel.dart';

class TemplatePage extends StatefulWidget {

  const TemplatePage({super.key});

  @override
  State<TemplatePage> createState() => _TemplatePageState();
}

class _TemplatePageState extends State<TemplatePage> {
  @override
  Widget build(BuildContext context) {
    TemplatesPageViewmodel templatesPageViewmodel=TemplatesPageViewmodel();
  HomePageViewmodel homePageViewmodel=HomePageViewmodel();
  bool isDark =Theme.of(context).brightness==Brightness.dark;

    return Scaffold(

      appBar: AppBar(backgroundColor: Color(0xFE7EBF2),
        leading: IconButton(
          onPressed: () {
            selected_page_notifier.value = 0;
          },
          icon: Icon(Icons.arrow_back_ios_outlined),
        ),
        title:Text('Templates',
          style: TextStyle(fontSize: 24,color: homePageViewmodel.getTextColor(isDark),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(child: SingleChildScrollView(
      child: Container(padding: EdgeInsets.all(20),
          child: Column(
            children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            RectangularTemplate(
                id: templatesPageViewmodel.ids.elementAt(0),
                name: templatesPageViewmodel.names.elementAt(0),
                amount: templatesPageViewmodel.amounts.elementAt(0),
              boxcolor: Colors.white,
              textcolor: Colors.black,

            ),
              RectangularTemplate(
                id: templatesPageViewmodel.ids.elementAt(0),
                name: templatesPageViewmodel.names.elementAt(0),
                amount: templatesPageViewmodel.amounts.elementAt(0),
                boxcolor: Colors.grey,
                textcolor: Colors.black,

              ),
            ],
            ),
              SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DesignedTemplate
                    (
                      id: templatesPageViewmodel.ids.elementAt(2),
                      name: templatesPageViewmodel.names.elementAt(2),
                      amount: templatesPageViewmodel.amounts.elementAt(2),
                      boxcolor: Colors.white,
                      textcolor: Colors.black),
                  DesignedTemplate
                    (
                      id: templatesPageViewmodel.ids.elementAt(3),
                      name: templatesPageViewmodel.names.elementAt(3),
                      amount: templatesPageViewmodel.amounts.elementAt(3),
                      boxcolor: Colors.grey,
                      textcolor: Colors.black),
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
