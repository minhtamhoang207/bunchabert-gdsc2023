import 'package:dio/dio.dart' hide Headers;
import 'package:magic_sign/core/utils/constants.dart';
import 'package:retrofit/retrofit.dart';

part 'sign_language_service.g.dart';

@RestApi(
    baseUrl: kSignLanguageURL
)
abstract class SignLanguageService {
  factory SignLanguageService(Dio dio, {String baseUrl}) = _SignLanguageService;

  @POST('/convertToSign')
  @DioResponseType(ResponseType.bytes)
  @Headers(<String, dynamic>{
    'Content-Type' : 'application/octet-stream',
  })
  Future<List<int>> getSignLanguageVideo(
      @Query('txt') String txt,
  );

  @POST('/convertImageToSign')
  @DioResponseType(ResponseType.bytes)
  @Headers(<String, dynamic>{
    'Content-Type' : 'application/octet-stream',
  })
  Future<List<int>> getSignLanguageVideoFromImg(
      @Body() MultipartFile fileUpload
  );
}