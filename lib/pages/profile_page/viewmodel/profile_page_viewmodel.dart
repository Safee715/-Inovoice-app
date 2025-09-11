import 'dart:async';
import 'package:DummyInvoice/pages/profile_page/model/profile.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ProfilePageViewmodel extends ChangeNotifier {

  List<Profile> _posts=[];
TextEditingController searchController=TextEditingController();
  final _controller=StreamController<List<Profile>>.broadcast();
  Stream<List<Profile>>get postsStream=>_controller.stream;

  List<Profile>get posts=>_posts;

  final dio=Dio(BaseOptions(
    baseUrl:'https://jsonplaceholder.typicode.com' ,
    headers: {
     "Accept": "application/json",
     "User-Agent": "Dart/Flutter"
  },
  ));


  void _emit()
  {
    _controller.sink.add(_posts);
  }

  void onSearch( String value)
  {if(value.isEmpty)
  {   _emit();
  }
  else{
   final  searchResult=_posts.where((element) => element.title.toString().contains(value)).toList();
    _controller.sink.add(searchResult);
  }
  }

   Future<void> getAllPosts()async
  {try
    {
      final response = await dio.get("/todos/");
      List<dynamic> data =  (response.data)as List<dynamic>;
      print('type : ${data.runtimeType}');
      List<Profile> profiles=data.map((e) {
        final map=e as Map<String,dynamic>;
        return Profile.fromMap(map);
      },).toList();
      _posts=profiles;
        _emit();
      print(response.statusMessage);
    }
    catch(e)
    {
      print('error is $e');
    }
}


Future<Profile> getProfile(int id)async
{
  final response=await dio.get('/todos/$id');
  final post=response.data;
  // print(post);
  Profile profile=Profile(
        userId: post['userId'] as int,
      id: post['id'] as int ,
      title: post['title']?.toString(),
      body: post['complete']?.toString(),
  );
  return profile;
}

Future<void> deleteProfile(int id)async
{
  try
  {
    final response = await dio.delete(
        '/todos/$id');
    print(response.data);
    if(response.statusCode==200||response.statusCode==201)
      {       print(response.statusMessage);
      _posts.removeWhere((profile) => profile.id==id,);
        _emit();
      }
  }
  catch(e)
  {
    print('Profile not deleted due to :$e');
  }

}


Future<void> addProfile(Profile profile)async
{
  try
  {
   final response=await dio.post('/todos/',data: profile.toMap());
   if(response.statusCode==200||response.statusCode==201)
     {
       print(response.statusMessage);
       _posts.add(profile);
        _emit();

     }
  }
  catch(e)
  {
    print('Profile not Added due to :$e');
  }

}


Future<void> editProfile(int id,Profile profile)async
{
  try{
    final response=await dio.put('/todos/$id',  data: {
      columnUserId:profile.userId,
      columnId:profile.id,
      columnTitle:profile.title,
      columnBody:profile.body,
    });
    print(response.statusMessage);
    if(response.statusCode==200||response.statusCode==201)
      {
        final index=_posts.indexWhere((element) => element.id==id,);
        _posts[index]=profile;
          _emit();
        notifyListeners();
        print('Post edited Successfully');
      }
    notifyListeners();

  }
  catch(e)
  {
    print('Profile not edited due to$e');
  }

}





}
