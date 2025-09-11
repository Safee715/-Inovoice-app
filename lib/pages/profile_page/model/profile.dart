import 'dart:convert';

final String columnUserId="userId";
final String columnId="id";
final String columnTitle='title';
final String columnBody='completed';

class Profile {
 final int userId;
 final int id;
  final String? title;
  final String? body;
  Profile({
 required this.userId,
 required this.id,
  this.title,
  this.body
  });
  Map<String,dynamic>toMap()
  {
     Map<String,dynamic> map=
         {
           columnUserId:userId,
           columnId:id,
           columnTitle:title,
           columnBody:body,
         };
     return map;
  }
factory Profile.fromMap(Map<String,dynamic> map)
{
  return Profile(
    userId: map['userId'] as int,
      id: map["id"] as int,
      title: map["title"]?.toString(),
      body: map["completed"] ?.toString()
  );
}
String toJson()=>jsonEncode(toMap());
factory Profile.fromJson(String source)=>
    Profile.fromMap(jsonDecode(source)as Map<String,dynamic>);

 @override
 String toString() {
   return 'Profile(userId: $userId, id: $id, title: $title, body: $body)';
 }
}
