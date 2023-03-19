import 'dart:io';

import 'package:magic_sign/data/data_source/remote/sign_language_service.dart';
import 'package:magic_sign/data/models/image_to_sign.dart';
import 'package:magic_sign/domain/repositories/sign_language_repository.dart';

class SignLanguageRepoImpl implements SignLanguageRepository {
  SignLanguageRepoImpl({required this.signLanguageService});
  SignLanguageService signLanguageService;

  @override
  Future<List<int>> getSignVideo({required String txt}) async {
    return await signLanguageService.getSignLanguageVideo(txt);
  }

  @override
  Future<ImageToSign> getSignVideoFromImg({required File fileUpload}) async {
    return await signLanguageService.getSignLanguageVideoFromImg(fileUpload);
  }

  @override
  Future<ImageToSign> sign2text({required File fileUpload}) async {
    return await signLanguageService.sign2text(fileUpload);
  }
}
