// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_language_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _SignLanguageService implements SignLanguageService {
  _SignLanguageService(this._dio, {this.baseUrl}) {
    baseUrl ??=
        'https://5f9e-2405-4802-134-1740-a913-fe77-8d80-e6e.ap.ngrok.io/api/v1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<int>> getSignLanguageVideo(txt) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'txt': txt};
    final _headers = <String, dynamic>{
      r'Content-Type': 'application/octet-stream'
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<List<int>>(
        Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: 'application/octet-stream',
                responseType: ResponseType.bytes)
            .compose(_dio.options, '/convertToSign',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!.cast<int>();
    return value;
  }

  @override
  Future<List<int>> getSignLanguageVideoFromImg(fileUpload) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': 'application/octet-stream'
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = fileUpload;
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<List<int>>(
        Options(
                method: 'POST',
                headers: _headers,
                extra: _extra,
                contentType: 'application/octet-stream',
                responseType: ResponseType.bytes)
            .compose(_dio.options, '/convertImageToSign',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!.cast<int>();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
