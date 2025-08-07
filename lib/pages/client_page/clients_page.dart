import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/pages/add_clients_page/add_clients_page.dart';
import 'package:DummyInvoice/pages/client_page/client_page_viewmodel.dart';
import 'package:DummyInvoice/widgets/client_page_nav_bar.dart';
import 'package:DummyInvoice/widgets/clients_details.dart';
import 'package:DummyInvoice/widgets/custom_icon_widget.dart';

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

     ClientPageViewmodel clientPageViewmodel=ClientPageViewmodel();
      HomePageViewmodel homePageViewmodel=HomePageViewmodel();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(titleSpacing: 0,
          scrolledUnderElevation: 0,
          leadingWidth: 70,elevation: 0,
          backgroundColor: Color(0xffF0F3F7),
          centerTitle: false,
          leading: IconButton(
            onPressed: () {
              clientPageViewmodel.backButtonFunction();
            },
            icon: CustomIconWidget(
                iconaddress: 'assets/images/icons/backarrow.svg',
                height: 28,
                weight: 28
            )
          ),
          title: Text(widget.title,
            style: TextStyle(color:Color(0xff303744),fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(top: false,
          child: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.only(
                left: homePageViewmodel.getWidth(context, 15),
                right: homePageViewmodel.getWidth(context, 15),
                bottom: 80,
              ),
              child: Column(
                children: [
                  ClientsDetails(
                    name: clientPageViewmodel.names.elementAt(0),
                    email: clientPageViewmodel.emails.elementAt(0),),
                  SizedBox(height: 5,),
                  ClientsDetails(
                    name: clientPageViewmodel.names.elementAt(1),
                    email: clientPageViewmodel.emails.elementAt(1),),
                  SizedBox(height: 5,),
                  ClientsDetails(
                    name: clientPageViewmodel.names.elementAt(2),
                    email: clientPageViewmodel.emails.elementAt(2),),
                  SizedBox(height: 5,),
                  ClientsDetails(
                    name: clientPageViewmodel.names.elementAt(3),
                    email: clientPageViewmodel.emails.elementAt(3),),
                  SizedBox(height: 5,),
                  ClientsDetails(
                    name: clientPageViewmodel.names.elementAt(4),
                    email: clientPageViewmodel.emails.elementAt(4),),
                  SizedBox(height: 5,),
                  ClientsDetails(
                    name: clientPageViewmodel.names.elementAt(5),
                    email: clientPageViewmodel.emails.elementAt(5),),
                  SizedBox(height: 5,),
                  ClientsDetails(
                    name: clientPageViewmodel.names.elementAt(6),
                    email: clientPageViewmodel.emails.elementAt(6),),
                  SizedBox(height: 5,),
                  ClientsDetails(
                    name: clientPageViewmodel.names.elementAt(7),
                    email: clientPageViewmodel.emails.elementAt(7),),
                  SizedBox(height: 5,),
                  ClientsDetails(
                    name: clientPageViewmodel.names.elementAt(8),
                    email: clientPageViewmodel.emails.elementAt(8),),
                  SizedBox(height: 5,),
          
                ],
              )
            ),
          ),
        ),
        floatingActionButton: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddClientsPage();
          },
          ),
      
          ) ;
      
        }, icon: CustomIconWidget(
            iconaddress: clientPageViewmodel.addButtonAddress,
            height: 54, weight: 54
        ),
        ),
        bottomNavigationBar: Container(
          color: Color(0xffF0F3F7),
          padding: EdgeInsets.only(
              bottom: 30.0, left: 50, right: 50),
          child: ClientPageNavBar(),
        ),
      
      ),
    );

  }
}
