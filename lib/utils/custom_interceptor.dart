import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CustomInterceptor extends Interceptor {
  final bool tokenRequired;
  CustomInterceptor({required this.tokenRequired});

  /// 헤더에 토큰을 추가하는 함수
  Future<String?> _getToken() async {
    String? token;

    return token;
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    super.onRequest(options, handler);

    // 헤더에 토큰 추가
    if (tokenRequired) {
      String? token = await _getToken();
      options.headers['Authorization'] = 'Bearer $token';
    }
    debugPrint('${options.method} 요청: ${options.path}');
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    super.onResponse(response, handler);

    debugPrint('${response.requestOptions.path} 성공(${response.statusCode})');
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(
        '${err.requestOptions.path} 실패(${err.response?.statusCode}): $err');
    super.onError(err, handler);
  }
}
