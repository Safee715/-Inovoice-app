import 'package:flutter/material.dart';

class AddClientViewmodel extends ChangeNotifier {

}

class Client {
  Client({
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  final firstName;
  final lastName;
  final email;
  String getFullName() => '$firstName $lastName';
}
