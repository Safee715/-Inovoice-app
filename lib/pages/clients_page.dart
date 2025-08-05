import 'package:flutter/material.dart';
import 'package:invoiceapp/data/notifiers.dart';
import 'package:invoiceapp/pages/add_clients_page.dart';
import 'package:invoiceapp/widgets/client_details_widget.dart';
import 'package:invoiceapp/widgets/client_page_nav_bar.dart';
import 'package:invoiceapp/widgets/custom_icon_widget.dart';

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
          child: Column(
            children: [
              ClientDetailsWidget(name: 'Jhon Wick',email: 'jhon@gmail.com',),
              SizedBox(height: 5,),
              ClientDetailsWidget(name: 'Peter Tinger',email: 'peter@gmail.com',),
              SizedBox(height: 5,),
              ClientDetailsWidget(name: 'Iron Man',email: 'iron@gmail.com',),
              SizedBox(height: 5,),
              ClientDetailsWidget(name: 'Jhon Wick',email: 'jhon@gmail.com',),
              SizedBox(height: 5,),
              ClientDetailsWidget(name: 'Peter Tinger',email: 'peter@gmail.com',),
              SizedBox(height: 5,),
              ClientDetailsWidget(name: 'Iron Man',email: 'iron@gmail.com',),
              SizedBox(height: 5,),
              ClientDetailsWidget(name: 'Jhon Wick',email: 'jhon@gmail.com',),
              SizedBox(height: 5,),
              ClientDetailsWidget(name: 'Peter Tinger',email: 'peter@gmail.com',),
              SizedBox(height: 5,),
              ClientDetailsWidget(name: 'Iron Man',email: 'iron@gmail.com',),
              SizedBox(height: 5,),

            ],
          )
        ),
      ),
      floatingActionButton: IconButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AddClientsPage();
        },
        ),
        ) ;

      }, icon: CustomIconWidget(
          iconaddress: 'assets/images/icons/add clients.svg',
          height: 60, weight: 60,
      ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 30.0, left: 50, right: 50),
        child: ClientPageNavBar(),
      ),

    );

  }
}
