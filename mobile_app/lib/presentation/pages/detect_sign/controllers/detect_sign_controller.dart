import 'dart:developer';
import 'dart:io';

// import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide MultipartFile;

import '../../../../domain/usecases/sign_language_usecase.dart';

class DetectSignController extends GetxController {
  DetectSignController({required this.signLanguageUseCases});

  SignLanguageUseCases signLanguageUseCases;

  RxString finalResponse = RxString('');

  RxBool playingAudio = RxBool(false);

  @override
  void onInit() async {
    super.onInit();
  }

  Future<RxStatus> getSignVideo(File file) async {
    try {
      final response =
          await signLanguageUseCases.getSignVideoFromImg(fileUpload: file);
      finalResponse.value = response.text ?? '';
      return RxStatus.success();
    } catch (e) {
      return RxStatus.error(e.toString());
    }
  }

  Future<RxStatus> sign2text(File file) async {
    try {
      final response = await signLanguageUseCases.sign2text(fileUpload: file);
      finalResponse.value = response.text ?? '';
      return RxStatus.success();
    } catch (e) {
      return RxStatus.error(e.toString());
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
