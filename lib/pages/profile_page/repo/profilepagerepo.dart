import 'package:DummyInvoice/data/helpers/api_base_helper.dart';
import 'package:DummyInvoice/pages/profile_page/model/profile.dart';
import 'package:dio/dio.dart';
class Tokens
{
static CancelToken? _cancelToken;
}
class ProfilePageRepo {
  static Future<List<Profile>> onSearch(
    String value,
  ) async {
    if(Tokens._cancelToken !=null&& !Tokens._cancelToken!.isCancelled )
    {
      Tokens._cancelToken!.cancel();
    }
    Tokens._cancelToken=CancelToken();
      if (value.isEmpty) {
        return [];
      } else {
        try {
          final dio =
              await ApiBaseHelper.buildDio();
          final response = await dio.get(
            '/profiles/',
            queryParameters: {'name': value},
            cancelToken: Tokens._cancelToken
          );
          final List<dynamic> data =
              response.data as List<dynamic>;
          final List<Profile> searchResult = data
              .map(
                (e) => Profile.fromMap(
                  e as Map<String, dynamic>,
                ),
              )
              .where(
                (element) =>
                    element.name
                        .toLowerCase()
                        .contains(
                          value.toLowerCase(),
                        ) ||
                    element.userId
                        .toString()
                        .contains(
                          value.toLowerCase(),
                        ),
              )
              .toList();
          print('search api called');
          return searchResult;
        } on DioException catch (e) {
          if(CancelToken.isCancel(e))
          {
            print("Request was cancelled: ${e.message}");
            return [];
          }
          else
          {
            if (e.response?.statusCode == 404) {
              return [];
            } else {
              throw Exception(
                ApiBaseHelper.getError(e),
              );
            }
          }
        }
      }

  }

  static Future<List<Profile>>
  getAllPosts() async {
    try {
      final dio = await ApiBaseHelper.buildDio();
      final response = await dio.get(
        '/profiles/',
      );
      List<dynamic> data =
          (response.data) as List<dynamic>;
      List<Profile> profiles = data.map((e) {
        final map = e as Map<String, dynamic>;
        return Profile.fromMap(map);
      }).toList();
      return profiles;
    } on DioException catch (e) {
      throw Exception(ApiBaseHelper.getError(e));
    }
  }

  static Future<Profile> getProfile(
    String id,
  ) async {
    try {
      final dio = await ApiBaseHelper.buildDio();
      final response = await dio.get(
        '/profiles/$id',
      );
      final post = response.data;
      Profile profile = Profile(
        userId: post['userId'] as int,
        name: post['name'].toString(),
        email: post['email'].toString(),
      );
      return profile;
    } on DioException catch (e) {
      throw Exception(ApiBaseHelper.getError(e));
    }
  }

  static Future<dynamic> deleteProfile(
    String id,
  ) async {
    try {
      final dio = await ApiBaseHelper.buildDio();
      final response = await dio.delete(
        '/profiles/$id',
      );
      return response;
    } on DioException catch (e) {
      throw Exception(ApiBaseHelper.getError(e));
    }
  }

  static Future<dynamic> addProfile(
    Profile profile,
  ) async {
    try {
      final dio = await ApiBaseHelper.buildDio();
      await dio.post(
        '/profiles/',
        data: profile.toMap(),
      );
      return;
    } on DioException catch (e) {
      throw Exception(ApiBaseHelper.getError(e));
    }
  }

  static Future<dynamic> editProfile(
    String id,
    Profile profile,
  ) async {
    try {
      final dio = await ApiBaseHelper.buildDio();
      await dio.put(
        '/profiles/$id',
        data: {
          'userId': profile.userId,
          'name': profile.name,
          'email': profile.email,
        },
      );
      return;
    } on DioException catch (e) {
      throw Exception(ApiBaseHelper.getError(e));
    }
  }
}
