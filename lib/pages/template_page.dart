import 'package:flutter/material.dart';
import 'package:invoiceapp/data/notifiers.dart';
import 'package:invoiceapp/widgets/client_page_nav_bar.dart';

class TemplatePage extends StatefulWidget {

  const TemplatePage({super.key,required this.title});
  final String title;
  @override
  State<TemplatePage> createState() => _TemplatePageState();
}

class _TemplatePageState extends State<TemplatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(backgroundColor: Color(0xFE7EBF2),
        leading: IconButton(
          onPressed: () {
            selected_page_notifier.value = 0;
          },
          icon: Icon(Icons.arrow_back_ios_outlined),
        ),
        title:Text(widget.title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClientPageNavBar(),
      ),


    );
  }
}
