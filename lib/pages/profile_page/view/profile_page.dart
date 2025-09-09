import 'package:DummyInvoice/data/helpers/assets.dart';
import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/data/languages/language_manager.dart';
import 'package:DummyInvoice/pages/add_clients_page/view/add_clients_page.dart';
import 'package:DummyInvoice/pages/profile_page/viewmodel/profile_page_viewmodel.dart';
import 'package:DummyInvoice/widgets/clients_details.dart';
import 'package:DummyInvoice/widgets/custom_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, this.constants});

  final Constants? constants;

  @override
  State<ProfilePage> createState() =>
      _ProfilePageState();
}

class _ProfilePageState
    extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final profilePageViewmodel=context.watch<ProfilePageViewmodel>();
    print('Profile');
    return Scaffold(
      appBar: AppBar(elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).getBackColor(),
        title: Text(
          widget
              .constants!
              .profilePageAppBarTitle,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
          Future.delayed(Duration(seconds: 2));
         await profilePageViewmodel.loadClients();
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child:
          StreamBuilder(
            stream: profilePageViewmodel.getClientStream(),
            builder: (context, snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting)
                {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              else if(snapshot.hasError)
                {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
              else if(snapshot.hasData)
                {  final clients = snapshot.data!;
                if(clients.isEmpty)
                  {
                    return Column(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        Center(
                          child: CircleAvatar(backgroundColor: Colors.white,
                            radius: 60,
                            child: ClipOval(
                              child: Icon(
                                Icons
                                    .person_rounded,
                                color: Colors.grey,
                                size: 90,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          LanguageManager.translate(
                              'noProfileAvailableText'),
                          style: TextStyle(
                            color: Theme.of(
                              context,
                            ).getHintTextColor(),
                          ),
                        ),
                      ],
                    );
                  }
                  else
                  {
                    return ListView.builder(
                      padding: EdgeInsets.only(bottom: context.getWidth(65)),
                      itemCount: clients.length,
                      itemBuilder: (context,
                          index) {
                        return Padding(
                          padding: const EdgeInsets
                              .symmetric(
                              vertical: 4.0),
                          child: ClientsDetails(
                            name: clients[index]
                                .firstName,
                            email: clients[index]
                                .email,
                            id: clients[index].id!,
                          ),
                        );
                      },
                    );
                  }
                  }else {
                return Column(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Colors
                            .white,
                        radius: 50,
                        child: ClipOval(
                          child: Icon(
                            Icons
                                .person_rounded,
                            color: Colors.grey,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      LanguageManager.translate(
                          'noProfileAvailableText'),
                      style: TextStyle(
                        color: Theme.of(
                          context,
                        ).getHintTextColor(),
                      ),
                    ),
                  ],
                );
              }
            },

          ),
        ),
      ),
      floatingActionButton: _addClientButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

    );
  }
  Widget _addClientButton(
      )
  {
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


