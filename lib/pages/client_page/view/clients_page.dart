import 'package:DummyInvoice/data/helpers/assets.dart';
import 'package:DummyInvoice/data/helpers/common_functions.dart';
import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/pages/add_clients_page/view/add_clients_page.dart';
import 'package:DummyInvoice/widgets/clients_details.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/pages/client_page/viewmodel/client_page_viewmodel.dart';
import 'package:DummyInvoice/widgets/custom_icon_widget.dart';
import 'package:provider/provider.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() =>
      _ClientsPageState();
}

class _ClientsPageState
    extends State<ClientsPage> {
  Constants constants = Constants();
  CommonFunctions commonFunctions=CommonFunctions();

  @override
  Widget build(BuildContext context) {
    print('ClientsPage');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          scrolledUnderElevation: 0,
          leadingWidth: 70,
          elevation: 0,
          backgroundColor: Theme.of(
            context,
          ).getBackColor(),
          centerTitle: false,
          leading: IconButton(
            onPressed: ()
            {
              commonFunctions.backButtonForSubNavigationPages(context);
            },
            icon: CustomIconWidget(
              iconaddress: Theme.of(context)
                  .getIconAddress(
                    Assets.NightModeBackButton,
                    Assets.LightModeBackButton,
                  ),
              height: 28,
              weight: 28,
            ),
          ),
          title: Text(
            constants.clientAppBarTitle,
            style: TextStyle(
              color: Theme.of(
                context,
              ).getTextColor(),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body:   _buildBody(),
        floatingActionButton: _addClientButton(),
        floatingActionButtonLocation:
            FloatingActionButtonLocation
                .endDocked,
      ),
    );
  }

  Widget _buildBody(

  ) {
    return Padding(
      padding: EdgeInsets.only(
        left: context.getWidth(15),
        right: context.getWidth(15),
      ),
      child:
          Consumer<ClientPageViewmodel>(
            builder: (context, clientPageViewmodel, child) {
              final noOfClients=clientPageViewmodel.getClientsNumber();
             if (noOfClients==0) {
               return Center(
                 child: Column(
                   mainAxisAlignment:
                   MainAxisAlignment
                       .center,
                   children: [
                     CustomIconWidget(
                       iconaddress:
                       Assets.NoDataIcon,
                       height: context
                           .getWidth(65),
                       weight: context
                           .getWidth(114),
                     ),
                     Text(
                       maxLines: 2,
                       softWrap: true,
                       constants
                           .noDataAvailableText,
                       style: TextStyle(
                         color: Color(
                           0xffBEC0CC,
                         ),
                         fontSize: 14,
                       ),
                     ),
                   ],
                 ),
               );
              }
             else {
               return
                 ListView.builder(
                   itemCount: noOfClients,
                   itemBuilder: (context, index) {
                     final bool isLast = index ==
                         noOfClients - 1;
                     final currentClient = clientPageViewmodel
                         .getClient(index);
                     return Padding(
                       padding: EdgeInsets.only(
                         top: context.getWidth(5),
                         bottom: context.getWidth(
                           isLast ? 50 : 5,
                         ),
                       ),
                       child: ClientsDetails(
                         clientPageViewmodel:
                         clientPageViewmodel,
                         name:
                         '${currentClient
                             .firstName} ${currentClient
                             .lastname}',
                         email: currentClient
                             .email,
                         id: currentClient.id!,
                       ),
                     );
                   },
                 );
             }
          },
          ),
    );


  }

  Widget _addClientButton(
  ) {

  return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AddClientsPage();
            },
          ),
        );
      },
      icon: CustomIconWidget(
        iconaddress: Assets.addButtonAddress,
        height: 54,
        weight: 54,
      ),
    );
  }
}
