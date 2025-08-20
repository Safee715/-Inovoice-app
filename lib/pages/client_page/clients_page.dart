import 'package:DummyInvoice/pages/home_page/home_page_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/pages/add_clients_page/add_clients_page.dart';
import 'package:DummyInvoice/pages/client_page/client_page_viewmodel.dart';
import 'package:DummyInvoice/widgets/clients_details.dart';
import 'package:DummyInvoice/widgets/custom_icon_widget.dart';
import 'package:provider/provider.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  late HomePageViewmodel homePageViewmodel ;
  @override

  void initState(){
  super.initState();

  homePageViewmodel =HomePageViewmodel();

}


  @override
  Widget build(BuildContext context) {
final clientPageViewmodel=context.watch<ClientPageViewmodel>();

    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          scrolledUnderElevation: 0,
          leadingWidth: 70,
          elevation: 0,
          backgroundColor: homePageViewmodel.getBackColor(isDark),
          centerTitle: false,
          leading: IconButton(
            onPressed: () {
              clientPageViewmodel.backButtonFunction();
            },
            icon: CustomIconWidget(
              iconaddress: homePageViewmodel.getIconAddress(
                isDark,
                'assets/images/icons/nightmode_backButton.svg',
                'assets/images/icons/backarrow.svg',
              ),
              height: 28,
              weight: 28,
            ),
          ),
          title: Text(
            'Clients',
            style: TextStyle(
              color: homePageViewmodel.getTextColor(isDark),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: homePageViewmodel.getWidth(context, 15),
            right: homePageViewmodel.getWidth(context, 15),
          ),
          child: ValueListenableBuilder(valueListenable: clientPageViewmodel.client,
            builder:(context, clients, child) {
            return  ValueListenableBuilder(
              valueListenable: clientPageViewmodel.client, builder: (context, emails, child) {
              if(clients.isEmpty)
              {
                return Center(child: Container(child: Text('No Clients Yet')));
              }
              else {
                print(clients.length);
                return ListView.builder(
                  itemCount: clients.length,
                  itemBuilder: (context, index) {
                    final bool isLast = index == clients.length - 1;
                    print('index==$index');
                    return Padding(
                      padding: EdgeInsets.only(
                        top: homePageViewmodel.getWidth(context, 5),
                        bottom: homePageViewmodel.getWidth(
                            context, isLast ? 50 : 5),
                      ),
                      child: ClientsDetails(
                        name:'${clientPageViewmodel.client.value.elementAt(index).firstName} ${clientPageViewmodel.client.value.elementAt(index).lastname}',
                        email:clientPageViewmodel.client.value.elementAt(index).email,
                        id: index,
                      ),
                    );
                  },
                );
              }
            },);

            } ,

          ),

        ),


        floatingActionButton: IconButton(
          onPressed:() {
            context.read<ClientPageViewmodel>().clearControllers();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddClientsPage();
            },)
            );
          },
          icon: CustomIconWidget(
            iconaddress: clientPageViewmodel.addButtonAddress,
            height: 54,
            weight: 54,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      ),
    );
  }
}
