import 'dart:math';

import 'package:magic_sign/data/data_source/remote/auth_service.dart';
import 'package:magic_sign/data/models/base_response.dart';
import 'package:magic_sign/data/models/user_sign_up.dart';
import 'package:magic_sign/domain/repositories/auth_repository.dart';


class AuthRepoImpl implements AuthRepository {

  AuthRepoImpl({required this.authService});
  AuthService authService;

  @override
  Future<BaseResponse> login({required UserAuth userAuth}) async {
    final response = await authService.login(userAuth);
    return response;
  }

  @override
  Future<BaseResponse> register({required UserAuth userAuth}) async {
    final response = await authService.register(userAuth);
    return response;
  }
}