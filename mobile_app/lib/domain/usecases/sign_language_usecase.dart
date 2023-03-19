import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:magic_sign/data/models/image_to_sign.dart';
import 'package:magic_sign/domain/repositories/sign_language_repository.dart';

class SignLanguageUseCases {
  final SignLanguageRepository signLanguageRepository;

  SignLanguageUseCases({required this.signLanguageRepository});

  FutureOr<List<int>> getSignVideo({required String content}) async {
    try {
      final response = await signLanguageRepository.getSignVideo(txt: content);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  FutureOr<ImageToSign> getSignVideoFromImg({required File fileUpload}) async {
    try {
      final response = await signLanguageRepository.getSignVideoFromImg(
          fileUpload: fileUpload);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  FutureOr<ImageToSign> sign2text({required File fileUpload}) async {
    try {
      final response =
          await signLanguageRepository.sign2text(fileUpload: fileUpload);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
