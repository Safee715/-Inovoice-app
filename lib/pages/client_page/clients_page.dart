import 'package:flutter/material.dart';
import 'package:invoiceapp/data/notifiers.dart';
import 'package:invoiceapp/pages/add_clients_page/add_clients_page.dart';
import 'package:invoiceapp/pages/client_page/client_page_viewmodel.dart';
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
     ClientPageViewmodel c1=ClientPageViewmodel();

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
              ClientDetailsWidget(name: c1.names.elementAt(0),email: c1.emails.elementAt(0),),
              SizedBox(height: 5,),
              ClientDetailsWidget(name: c1.names.elementAt(1),email: c1.emails.elementAt(1),),
              SizedBox(height: 5,),
              ClientDetailsWidget(name: c1.names.elementAt(2),email: c1.emails.elementAt(2),),
              SizedBox(height: 5,),
              ClientDetailsWidget(name: c1.names.elementAt(3),email: c1.emails.elementAt(3),),
              SizedBox(height: 5,),
              ClientDetailsWidget(name: c1.names.elementAt(4),email: c1.emails.elementAt(4),),
              SizedBox(height: 5,),
              ClientDetailsWidget(name: c1.names.elementAt(5),email: c1.emails.elementAt(5),),
              SizedBox(height: 5,),
              ClientDetailsWidget(name: c1.names.elementAt(6),email: c1.emails.elementAt(6),),
              SizedBox(height: 5,),
              ClientDetailsWidget(name: c1.names.elementAt(7),email: c1.emails.elementAt(7),),
              SizedBox(height: 5,),
              ClientDetailsWidget(name: c1.names.elementAt(8),email: c1.emails.elementAt(8),),
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
          iconaddress: c1.addButtonAddress,
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
