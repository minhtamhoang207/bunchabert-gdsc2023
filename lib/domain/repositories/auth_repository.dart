import 'package:magic_sign/data/models/base_response.dart';
import 'package:magic_sign/data/models/user_sign_up.dart';


abstract class AuthRepository {
  Future<BaseResponse> register({required UserAuth userAuth});
  Future<BaseResponse> login({required UserAuth userAuth});
}