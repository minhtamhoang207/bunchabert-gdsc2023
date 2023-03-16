import 'dart:async';

import 'package:dio/dio.dart';
import 'package:magic_sign/core/helpers/exception.dart';
import 'package:magic_sign/data/models/base_response.dart';
import 'package:magic_sign/domain/repositories/auth_repository.dart';
import 'package:magic_sign/domain/repositories/news_repository.dart';

import '../../data/models/user_sign_up.dart';


class AuthUseCase {
  final AuthRepository authRepository;

  AuthUseCase({required this.authRepository});

  Future<BaseResponse> register({required UserAuth userAuth}) async {
    try {
      final response = await authRepository.register(userAuth: userAuth);
      return response;
    } on DioError catch (e){
      throw createErrorEntity(e);
    }
  }

  Future<BaseResponse> login({required UserAuth userAuth}) async {
    try {
      final response = await authRepository.login(userAuth: userAuth);
      return response;
    } on DioError catch (e){
      throw createErrorEntity(e);
    }
  }
}