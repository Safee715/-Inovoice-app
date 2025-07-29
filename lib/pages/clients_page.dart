import 'package:flutter/material.dart';
import 'package:invoiceapp/data/notifiers.dart';
import 'package:invoiceapp/pages/add_clients_page.dart';
import 'package:invoiceapp/widgets/client_page_nav_bar.dart';
import 'package:invoiceapp/widgets/gradient_icon_widget.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key,
    required this.title});

  final String title;
  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
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
        title: Text(widget.title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(color: Colors.grey[400],),
        ),
      ),
      floatingActionButton: IconButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AddClientsPage();
        },),) ;

      }, icon: GradientIconWidget(size: 50,
    gradient: LinearGradient(
    colors: [Color(0xFF4082E3),Color(0xFF9CD9FF)]
    ),icon: Icons.add_circle,
    ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClientPageNavBar(),
      ),

    );

  }
}
