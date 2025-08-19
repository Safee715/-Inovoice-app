
import 'package:flutter/foundation.dart';

class
    AddClientViewmodel extends ChangeNotifier{

  final  appBarTitle='Add Client';
  final  firstNameLabel='First Name';
  final  lastNameLabel='Last Name';
  final  firstName='Tommy';
  final  lastName='Hope';
  final emailAddress='Email Address';
  final phoneNo='Phone Number';
  final phoneNoHint='+966 6599 56587';
  final emailAddressHint='jhonjames@gmail.com';
  final addressHint  ='London west street No (57)';
  final address='Address';
  final  saveClientButtonText='Save to Client Lists';
  final  addButtonText='Add';




}

class Client
{
  Client({required this.firstName,
    required this.lastName,
    required this.email});

  final firstName;
  final lastName;
  final email;
  String getFullName()=>'$firstName $lastName';

}