
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';


// class DioClient {
//   factory DioClient() {
//     return _singleton;
//   }

//   DioClient._internal() {
//     init();
//   }

//   static final DioClient _singleton = DioClient._internal();

//   late Dio _dio;
//   late Dio _tokenDio;

//   //static SharedPreferences? prefs;

//   int authFailCount = 0;

//   String token = "";
//   String deviceInfo = "";

//   // Future<String> _getAuthorizationToken() async {
//   //   prefs ??= await SharedPreferences.getInstance();
//   //   token = prefs?.getString(StorageKeys.token) ?? "";
//   //   print(token);
//   //   return token;
//   // }

//   // Future<String> _getDeviceInfo() async {
//   //   prefs ??= await SharedPreferences.getInstance();
//   //   deviceInfo = prefs?.getString(StorageKeys.deviceInfo) ?? "";
//   //   print(deviceInfo);
//   //   return deviceInfo;
//   // }

//   String getDeviceInfo() {
//     return deviceInfo;
//   }
//   String getAuthorizationToken() {
//     return token;
//   }

//   dynamic init() {
//     _dio = Dio();
//     _dio.options = BaseOptions(
//         validateStatus: (status) => status! < 500, baseUrl: "https://api.github.com/search/users?q=followers%3A%3E%3D1000&ref=searchresults&s=followers&type=Users");
//     // Used to get token
//     _tokenDio = Dio();
//     _tokenDio.options = BaseOptions(
//       validateStatus: (status) => status! < 500,
//       // baseUrl: URLS.baseUrl,
//       baseUrl: "https://api.github.com/search/users?q=followers%3A%3E%3D1000&ref=searchresults&s=followers&type=Users",
//     );
//     _tokenDio.interceptors.add(
//       InterceptorsWrapper(onRequest: (options, handler) async {
//         return handler.next(options);
//       }, onResponse: (response, handler) async {
//         debugPrint(response.realUri.toString());

//         debugPrint(response.statusCode.toString());
//         return handler.next(response);
//       }, onError: (error, handler) {
//         debugPrint(error.response?.realUri.toString());
//         debugPrint(error.response?.statusCode.toString());
//         return handler.next(error);
//       }),
//     );

//     _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
//       options.headers['Accept'] = 'application/json';
//       if (options.headers.keys.contains('Content-Type'.toLowerCase())) {
//         options.headers.remove('Content-Type'.toLowerCase());
//       }
//       options.headers['Content-Type'] = 'application/json';

//       options.queryParameters['platform'] = 'mobile';

//       // final token = await _getAuthorizationToken();
//       // if (token.isNotEmpty) {
//       //   options.headers['Authorization'] = 'Bearer $token';
//       // }
//       // final deviceInfo = await _getDeviceInfo();
//       // if (deviceInfo.isNotEmpty) {
//       //   options.headers['device_info'] = deviceInfo;
//       // }

//       return handler.next(options);
//     }, onResponse: (response, handler) async {
//       // Do something with response data
//       // TODO: Remove Print Statements
//       debugPrint(response.realUri.toString());
//       debugPrint(response.statusCode.toString());

//       if (response.statusCode == 401) {
//         // _dio.interceptors.requestLock.lock();
//         // _dio.interceptors.responseLock.lock();
//         final options = response.requestOptions;

//         return handler.next(response);

//         authFailCount += 1;

//         // if (authFailCount >= 4) {
//         //   authManager.logout();
//         //   return handler.resolve(response);
//         // }
//         //
//         // final fetchStatus = await authManager.refreshToken();
//         //
//         // if (fetchStatus.status != ResponseStatus.SUCCESS) {
//         //   authManager.logout();
//         //   return handler.resolve(response);
//         // }
//         //
//         // options.headers["Authorization"] =
//         // "Bearer ${await _getAuthorizationToken()}";
//         //
//         // // _dio.interceptors.requestLock.unlock();
//         // // _dio.interceptors.responseLock.unlock();
//         //
//         // if (options.data is FormData) {
//         //   final formData = FormData();
//         //   formData.fields.addAll(options.data.fields);
//         //   options.data = formData;
//         // }
//         //
//         // final Response responses = await _dio.fetch(options);
//         //
//         // return handler.resolve(responses);
//       } else {
//         authFailCount = 0;
//         return handler.resolve(response);
//       }
//     }, onError: (error, handler) async {
//       // TODO: Remove Print Statements
//       debugPrint('Error');
//       debugPrint(error.response?.realUri.toString());
//       debugPrint(error.response?.data.toString());
//       debugPrint(error.response?.statusCode?.toString() ?? '');

//       // try {
//       //   print(error?.response?.data);
//       // } catch (err) {
//       //   print(err);
//       // }
//       if (error.response?.statusCode == 401) {
//         _dio.interceptors.requestLock.lock();
//         _dio.interceptors.responseLock.lock();
//         final options = error.response?.requestOptions;

//         return handler.reject(error);

//         // final fetchStatus = await authManager.refreshToken();
//         //
//         // if (fetchStatus.status != ResponseStatus.SUCCESS) {
//         //   authManager.logout();
//         //   return error;
//         // }
//         //
//         // options.headers["Authorization"] =
//         // "Bearer ${await _getAuthorizationToken()}";
//         //
//         // _dio.interceptors.requestLock.unlock();
//         // _dio.interceptors.responseLock.unlock();
//         //
//         // if (options.data is FormData) {
//         //   final formData = FormData();
//         //   formData.fields.addAll(options.data.fields);
//         //   options.data = formData;
//         // }
//         //
//         // final res = await _dio.fetch(options);
//         //
//         // return handler.resolve(res);
//       } else {
//         return handler.reject(error);
//       }
//     }));
//   }

//   Dio get ref => _dio;

//   Dio get tokenRef => _tokenDio;
// }

// final dioClient = DioClient();

import 'package:dio/dio.dart';
class BaseNetwork {
  factory BaseNetwork() {

    return _singleton;
  }

  BaseNetwork._internal() {
    _init();
  }

  static final BaseNetwork _singleton = BaseNetwork._internal();

  Dio ?_dio ;

  dynamic _init() {

    _dio = Dio();
    _dio?.options = BaseOptions(
      baseUrl: "https://api.github.com",
    );
  }
  Dio? get ref => _dio;
}
final dioClient = BaseNetwork();
