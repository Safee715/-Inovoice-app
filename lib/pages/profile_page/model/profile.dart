import 'dart:convert';

final String columnId="id";
final String columnUserId="userId";
final String columnName='name';
final String columnEmail='email';

class Profile {
 final String? id;
 final int userId;
  final String name;
  final String email;
  Profile({
   this.id,
  required this.userId,
  required this.name,
  required this.email
  });
  Map<String,dynamic>toMap()
  {
     Map<String,dynamic> map=
         {  columnId:id,
           columnId:userId,
           columnName:name,
           columnEmail:email,
         };
     return map;
  }
factory Profile.fromMap(Map<String,dynamic> map)
{
  return Profile(
      id: map["id"] .toString(),
      userId: map["userId"] as int,
      name: map["name"].toString(),
      email: map["email"].toString()
  );
}
String toJson()=>jsonEncode(toMap());
factory Profile.fromJson(String source)=>
    Profile.fromMap(jsonDecode(source)as Map<String,dynamic>);

 @override
 String toString() {
   return 'Profile( id: $id,userId: $userId, name: $name, email: $email)';
 }
}
