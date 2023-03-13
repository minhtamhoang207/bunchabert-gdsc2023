import 'package:dio/dio.dart';
import 'package:magic_sign/core/utils/constants.dart';
import 'package:magic_sign/data/models/base_response.dart';
import 'package:magic_sign/data/models/user_sign_up.dart';
import 'package:retrofit/http.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: kBaseURL)
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST('/auth/register')
  Future<BaseResponse> register(@Body() UserAuth userAuth);

  @POST('/auth/login')
  Future<BaseResponse> login(@Body() UserAuth userAuth);

}