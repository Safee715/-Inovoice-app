import 'package:DummyInvoice/data/helpers/constants.dart';
import 'package:DummyInvoice/data/helpers/extensions.dart';
import 'package:DummyInvoice/data/languages/language_manager.dart';
import 'package:DummyInvoice/pages/client_page/model/clients_page_model.dart';
import 'package:DummyInvoice/pages/client_page/repo/clients_page_repo.dart';
import 'package:DummyInvoice/widgets/clients_details.dart';
import 'package:DummyInvoice/widgets/custom_clipper.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, this.constants});

  final Constants? constants;

  @override
  State<ProfilePage> createState() =>
      _ProfilePageState();
}

class _ProfilePageState
    extends State<ProfilePage> {
  ClientsPageRepo clientsPageRepo=ClientsPageRepo();
  @override
  Widget build(BuildContext context) {
    print('Profile');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFE7EBF2),
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
      body: Container(
        width: double.infinity,
        height: 500,
        padding: EdgeInsets.all(20),
        child:
        FutureBuilder<List<Client>>(
          future: clientsPageRepo.getAllClients(),
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
                    itemCount: clients.length,
                    itemBuilder: (context,
                        index) {
                      return Padding(
                        padding: const EdgeInsets
                            .symmetric(
                            vertical: 8.0),
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
    );
  }
}
