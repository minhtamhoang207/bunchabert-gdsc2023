import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:magic_sign/core/utils/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'exception.dart';

class RestClient {
  Dio init() {
    final dio = Dio()..options = BaseOptions(baseUrl: kBaseURL);
    dio.interceptors.addAll([
      AppInterceptors(),
      PrettyDioLogger(
          requestHeader: false,
          responseHeader: false,
          requestBody: true,
          responseBody: true,
          error: true,
          compact: true,
          maxWidth: 90)
    ]);
    return dio;
  }
}

class AppInterceptors implements Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    SharedPreferences prefs = Get.find<SharedPreferences>();
    final token = prefs.getString(kBearerToken);
    options.headers.putIfAbsent('Authorization', () => 'Bearer $token');
    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
