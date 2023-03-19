// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_language_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _SignLanguageService implements SignLanguageService {
  _SignLanguageService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??=
        'https://d395-2405-4802-1d73-e0f0-372-5cdb-ec2d-6842.ap.ngrok.io/api/v1';
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
    final Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<List<dynamic>>(_setStreamType<List<int>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/octet-stream',
      responseType: ResponseType.bytes,
    )
            .compose(
              _dio.options,
              '/convertToSign',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!.cast<int>();
    return value;
  }

  @override
  Future<ImageToSign> getSignLanguageVideoFromImg(fileUpload) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.files.add(MapEntry(
      'fileUpload',
      MultipartFile.fromFileSync(
        fileUpload.path,
        filename: fileUpload.path.split(Platform.pathSeparator).last,
      ),
    ));
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ImageToSign>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              '/convertImageToSign',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ImageToSign.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ImageToSign> sign2text(fileUpload) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = FormData();
    _data.files.add(MapEntry(
      'fileUpload',
      MultipartFile.fromFileSync(
        fileUpload.path,
        filename: fileUpload.path.split(Platform.pathSeparator).last,
      ),
    ));
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ImageToSign>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              '/sign2text',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ImageToSign.fromJson(_result.data!);
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
