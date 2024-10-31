import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_skeleton/utils/custom_interceptor.dart';

class API {
  static final dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['SERVER_API']!,
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  /* BASE API (GET, POST, PATCH, DELETE) */

  /// ### API GET
  /// 데이터를 받아올 때 GET 요청을 보내는 함수
  ///
  /// `tokenRequired`를 `false`로 설정하면 API 요청시 토큰을 헤더에 포함시키지 않음.
  static Future<dynamic> _getApi(
    String endPoint, {
    Map<String, dynamic>? queryParameters,
    bool tokenRequired = true,
  }) async {
    // dio interceptor을 사용해 에러 핸들링
    dio.interceptors.add(CustomInterceptor(tokenRequired: tokenRequired));
    return await dio.get(endPoint, queryParameters: queryParameters);
  }

  /// ### API POST
  /// 데이터 생성시 POST 요청을 보내는 함수
  ///
  /// `tokenRequired`를 `false`로 설정하면 API 요청시 토큰을 헤더에 포함시키지 않음.
  static Future<dynamic> _postApi(
    String endPoint, {
    String? jsonData,
    bool tokenRequired = true,
  }) async {
    // dio interceptor을 사용해 에러 핸들링
    dio.interceptors.add(CustomInterceptor(tokenRequired: tokenRequired));
    return await dio.post(endPoint, data: jsonData);
  }

  /// ### API PATCH
  /// 데이터 일부 수정시 PATCH 요청을 보내는 함수
  ///
  /// `tokenRequired`를 `false`로 설정하면 API 요청시 토큰을 헤더에 포함시키지 않음.
  static Future<dynamic> _patchApi(
    String endPoint, {
    String? jsonData,
    bool tokenRequired = true,
  }) async {
    // dio interceptor을 사용해 에러 핸들링
    dio.interceptors.add(CustomInterceptor(tokenRequired: tokenRequired));
    return await dio.patch(endPoint, data: jsonData);
  }

  /// ### API DELETE
  /// 데이터 삭제시 DELETE 요청을 보내는 함수
  ///
  /// `tokenRequired`를 `false`로 설정하면 API 요청시 토큰을 헤더에 포함시키지 않음.
  static Future<dynamic> _deleteApi(
    String endPoint, {
    bool tokenRequired = true,
  }) async {
    // dio interceptor을 사용해 에러 핸들링
    dio.interceptors.add(CustomInterceptor(tokenRequired: tokenRequired));
    return await dio.patch(endPoint);
  }
}
