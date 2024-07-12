import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../config/Constants.dart';

class WebService {
  static WebService? _this;
  Dio freeDio = Dio();
  Dio tokenDio = Dio();

  // use singleton pattern to use same object every time
  factory WebService() {
    _this ??= WebService._();
    return _this!;
  }

  WebService._() {
    // use constant base url in dio objects
    freeDio.options.baseUrl = Constants.baseUrl;
    tokenDio.options.baseUrl = Constants.baseUrl;
    // max time for request is 30 sec then give timeout
    freeDio.options.connectTimeout = const Duration(milliseconds: 30000);
    freeDio.options.receiveTimeout = const Duration(milliseconds: 30000);
    tokenDio.options.connectTimeout = const Duration(milliseconds: 30000);
    tokenDio.options.receiveTimeout = const Duration(milliseconds: 30000);
    dioInterceptors();
  }

  dioInterceptors() {
    // clear cached interceptor
    freeDio.interceptors.clear();
    tokenDio.interceptors.clear();

    // add interceptor to dio object
    freeDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          debugPrint(
              'send request：baseURL:${options.baseUrl} path:${options.path}，');
          debugPrint('headers: ${options.headers}');
          debugPrint('query parameters: ${options.queryParameters}');
          debugPrint('data: ${options.data}');
          debugPrint('data: ${options.connectTimeout}');
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          debugPrint("status code: ${response.requestOptions.path}");
          debugPrint("status code: ${response.statusCode}");
          debugPrint("data: ${response.data}");
          return handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) {
          debugPrint('path: ${e.requestOptions.path}');
          debugPrint('statusCode: ${e.response?.statusCode}');
          debugPrint('response: ${e.response}');
          debugPrint('data: ${e.response?.data}');
          debugPrint("error ${e.error}");
          debugPrint("message ${e.message}");
          debugPrint("type ${e.type}");
          return handler.next(e);
        },
      ),
    );
    tokenDio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        debugPrint(
            'send request：baseURL:${options.baseUrl} path:${options.path}，');
        debugPrint('headers: ${options.headers}');
        debugPrint('query parameters: ${options.queryParameters}');
        debugPrint('data: ${options.data}');
        debugPrint('data: ${options.connectTimeout}');

        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        debugPrint("status code: ${response.requestOptions.path}");
        debugPrint("status code: ${response.statusCode}");
        debugPrint("data: ${response.data}");

        return handler.next(response);
      },
      onError: (DioException e, ErrorInterceptorHandler handler) {
        debugPrint('path: ${e.requestOptions.path}');
        debugPrint('statusCode: ${e.response?.statusCode}');
        debugPrint('response: ${e.response}');
        debugPrint('data: ${e.response?.data}');
        debugPrint("error ${e.error}");
        debugPrint("message ${e.message}");
        debugPrint("type ${e.type}");
        return handler.next(e);
      },
    ));
  }
}
