import 'package:DummyInvoice/data/helpers/errors.dart';
import 'package:DummyInvoice/data/helpers/urls.dart';
import 'package:dio/dio.dart';

class ApiBaseHelper {
 static Map<String, String> getHeaders()  {
   Map<String, String> headers = {
     "Accept": "application/json",
     "User-Agent": "Dart/Flutter",
   };
   return headers;
 }

 static Dio buildDio ()
 {
   return Dio(
     BaseOptions(
       headers: getHeaders(),
       baseUrl: Urls.mockApi,
       connectTimeout: const Duration(
         seconds: 20,
       ),
     ),   )..
      interceptors.add(
     InterceptorsWrapper(
       onRequest: (options, handler) {
         return handler.next(options);
       },
       onResponse: (response, handler) {
         return handler.next(response);
       },
       onError: (DioException e, handler) {
         return handler.next(e);
       },
     ),
   );

 }
 static String getError(DioException e)
  {
    switch (e.type)
    {
      case DioExceptionType.connectionTimeout:
        return Errors.ConnectionTimeOutError;
      case DioExceptionType.connectionError:
        return Errors.InternetError;
      case DioExceptionType.badResponse:
        final statusCode=e.response?.statusCode??0;
        if (statusCode == 400) return Errors.BadRequest;
        if (statusCode == 401) return Errors.SessionExpired;
        if (statusCode == 404) return Errors.Resource;
        if (statusCode == 500) return Errors.InternalServerError;
        return Errors.GeneralError;
      case DioExceptionType.receiveTimeout:
        return Errors.ReceiveTimeOutError;
      case DioExceptionType.cancel:
        return Errors.RequestCancelled;
      default:
        return Errors.GeneralError;
    }
  }
}
