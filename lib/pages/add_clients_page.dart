import 'package:flutter/material.dart';
import 'package:invoiceapp/widgets/navbar_widget.dart';

class AddClientsPage extends StatefulWidget {
  const AddClientsPage({super.key});

  @override
  State<AddClientsPage> createState() => _AddClientsPageState();
}

class _AddClientsPageState extends State<AddClientsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(),
      body: Container(),
            bottomNavigationBar: NavbarWidget(),

    );
  }
}
