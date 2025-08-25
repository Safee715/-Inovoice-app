import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/pages/add_clients_page/view/add_clients_page.dart';
import 'package:flutter/material.dart';
import 'package:DummyInvoice/pages/client_page/viewmodel/client_page_viewmodel.dart';
import 'package:DummyInvoice/widgets/clients_details.dart';
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

  @override
  Widget build(BuildContext context) {
    final clientPageViewmodel = context
        .watch<ClientPageViewmodel>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          scrolledUnderElevation: 0,
          leadingWidth: 70,
          elevation: 0,
          backgroundColor: Theme.of(context)
              .getBackColor(),
          centerTitle: false,
          leading: IconButton(
            onPressed: () {
              clientPageViewmodel
                  .backButtonFunction();
            },
            icon: CustomIconWidget(
              iconaddress: Theme.of(context)
                  .getIconAddress(
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
              color: Theme.of(context)
                  .getTextColor(),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: context.getWidth(15),
            right: context.getWidth(15),
          ),
          child: ValueListenableBuilder(
            valueListenable:
                clientPageViewmodel.client,
            builder: (context, clients, child) {
              return ValueListenableBuilder(
                valueListenable:
                    clientPageViewmodel.client,
                builder: (context, emails, child) {
                  if (clients.isEmpty) {
                    return Center(
                      child: Container(
                        child: Column(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .center,
                          children: [
                            CustomIconWidget(
                              iconaddress:
                                  'assets/images/icons/noDataIcon.svg',
                              height:
                                  context
                                      .getWidth(
                                        65,
                                      ),
                              weight:
                                  context
                                      .getWidth(
                                        114,
                                      ),
                            ),
                            Text(
                              maxLines: 2,
                              softWrap: true,
                              'No Data Available!',
                              style: TextStyle(
                                color: Color(
                                  0xffBEC0CC,
                                ),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    print(clients.length);
                    return ListView.builder(
                      itemCount: clients.length,
                      itemBuilder: (context, index) {
                        final bool isLast =
                            index ==
                            clients.length - 1;
                        print('index==$index');
                        return Padding(
                          padding: EdgeInsets.only(
                            top: context
                                .getWidth(5),
                            bottom:
                                context
                                    .getWidth(
                                      isLast
                                          ? 50
                                          : 5,
                                    ),
                          ),
                          child: ClientsDetails(
                            name:
                                '${clientPageViewmodel.client.value.elementAt(index).firstName} ${clientPageViewmodel.client.value.elementAt(index).lastname}',
                            email:
                                clientPageViewmodel
                                    .client
                                    .value
                                    .elementAt(
                                      index,
                                    )
                                    .email,
                            id: index,
                          ),
                        );
                      },
                    );
                  }
                },
              );
            },
          ),
        ),

        floatingActionButton: IconButton(
          onPressed: () {
            context
                .read<ClientPageViewmodel>()
                .clearControllers();
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
            iconaddress: clientPageViewmodel
                .addButtonAddress,
            height: 54,
            weight: 54,
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation
                .endDocked,
      ),
    );
  }
}
