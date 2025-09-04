
final String clientTableName = 'Clients';
final String columnClientId = 'Id';
final String columnFirstName = 'FirstName';
final String columnLastName = 'LastName';
final String columnEmail = 'Email';
final String columnPhone = 'Phone';
final String columnAddress = 'Address';



class Client {
  int ?id;
  String firstName;
  String lastname;
  String email;
  String phoneNo;
  String address;

  Client({
    this.id,
    required this.firstName,
    required this.lastname,
    required this.email,
    required this.phoneNo,
    required this.address,
  });
  Map<String, dynamic> toMap() {
   var map=<String,dynamic>
   {
    columnClientId:id,
     columnFirstName:firstName,
     columnLastName:lastname,
     columnEmail:email,
     columnPhone:phoneNo,
     columnAddress:address,
   };

   return map;
  }
  factory Client.fromMap(Map<String ,dynamic> map)
  { return Client(
    id:map[columnClientId] as int?,
    firstName:map[columnFirstName] as String,
    lastname:map[columnLastName] as String,
    email:map[columnEmail] as String,
    phoneNo:map[columnPhone] as String,
    address:map[columnAddress] as String
  );

  }


}