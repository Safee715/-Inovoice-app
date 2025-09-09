import 'dart:async';
import 'package:DummyInvoice/pages/client_page/repo/clients_page_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:DummyInvoice/pages/client_page/model/clients_page_model.dart';

class ProfilePageViewmodel
    extends ChangeNotifier {
  ProfilePageViewmodel({required this.clientsPageRepo}) {
    loadClients();
  }
  final ClientsPageRepo clientsPageRepo;
  List<Client> _clients = [];

  Future<void> loadClients() async {
    _clients = await clientsPageRepo
        .getAllClients();
    clientController.sink.add(
      List.from(_clients),
    );
  }

  final clientController =
      StreamController<List<Client>>.broadcast();

  Stream<List<Client>> getClientStream() async* {
    yield _clients;
    yield* clientController.stream;
  }

  int get NoOfClients => _clients.length;

  Client getClient(int index) {
    return _clients[index];
  }

  void addClient(Client client) {
    _clients.add(client);
    clientController.sink.add(
      List.from(_clients),
    );
  }

  void addClientStream(Client client) {
    _clients.add(client);
    clientController.sink.add(_clients);
  }
}
