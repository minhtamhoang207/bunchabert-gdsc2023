import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:magic_sign/core/utils/constants.dart';
import 'package:magic_sign/data/models/image_to_sign.dart';
import 'package:retrofit/retrofit.dart';

part 'sign_language_service.g.dart';

@RestApi(baseUrl: kSignLanguageURL)
abstract class SignLanguageService {
  factory SignLanguageService(Dio dio, {String baseUrl}) = _SignLanguageService;

  @POST('/convertToSign')
  @DioResponseType(ResponseType.bytes)
  @Headers(<String, dynamic>{
    'Content-Type': 'application/octet-stream',
  })
  Future<List<int>> getSignLanguageVideo(
    @Query('txt') String txt,
  );

  @POST('/convertImageToSign')
  @MultiPart()
  Future<ImageToSign> getSignLanguageVideoFromImg(
      @Part(name: 'fileUpload') File fileUpload);

  @POST('/sign2text')
  @MultiPart()
  Future<ImageToSign> sign2text(@Part(name: 'fileUpload') File fileUpload);
}
