import 'dart:async';
import 'package:DummyInvoice/pages/profile_page/model/profile.dart';
import 'package:DummyInvoice/pages/profile_page/repo/profilepagerepo.dart';
import 'package:flutter/cupertino.dart';

class ProfilePageViewmodel
    extends ChangeNotifier {
  Timer? _debounce;
  final _controller =
      StreamController<List<Profile>>.broadcast();
      TextEditingController searchController=TextEditingController();
      Stream<List<Profile>> get postsStream =>_controller.stream;



  void onSearch(String value) async {
    if(_debounce?.isActive??false)_debounce!.cancel();
    _debounce=Timer(const Duration(milliseconds: 500),()async
        {
          try {
        final List<Profile> searchResults =
        await ProfilePageRepo.onSearch(value);
        _controller.sink.add(searchResults);
        } catch (e)
    {
      _controller.addError(e);
    }
  }
  );

  }

  Future<void> getAllPosts() async {
    try {
      final List<Profile> profiles =
          await ProfilePageRepo.getAllPosts();
      print('get all posts api called');
      _controller.sink.add(profiles);
    } on Exception catch (e) {
      _controller.addError(e);
    }
  }

  Future<Profile?> getProfile(String id) async {
    try {
      final profile =
          await ProfilePageRepo.getProfile(id);
      print('get post api called');
      return profile;
    } on Exception catch (e) {
      _controller.addError(e);
      return null;
    }
  }

  Future<void> deleteProfile(String id) async {
    try {
      await ProfilePageRepo.deleteProfile(id);
      print('delete post api called');

      final List<Profile> profiles =
          await ProfilePageRepo.getAllPosts();
      _controller.sink.add(profiles);
    } on Exception catch (e) {
      _controller.addError(e);
    }
  }

  Future<void> addProfile(Profile profile) async {
    try {
      await ProfilePageRepo.addProfile(profile);
      print('add post api called');

      final List<Profile> profiles =
          await ProfilePageRepo.getAllPosts();
      _controller.sink.add(profiles);
    } on Exception catch (e) {
      _controller.addError(e);
    }
  }

  Future<void> editProfile(
    String id,
    Profile profile,
  ) async {
    try {
      await ProfilePageRepo.editProfile(
        id,
        profile,
      );
      final List<Profile> profiles =
          await ProfilePageRepo.getAllPosts();
      print('edit post api called');
      _controller.sink.add(profiles);
    } on Exception catch (e) {
      _controller.addError(e);
    }
  }
  @override
  void dispose() {
    _debounce?.cancel();
    _controller.close();
    super.dispose();
  }
}
