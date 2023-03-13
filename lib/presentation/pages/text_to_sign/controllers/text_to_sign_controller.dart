import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:magic_sign/domain/usecases/sign_language_usecase.dart';
import 'package:permission_handler/permission_handler.dart';

class TextToSignController extends GetxController with StateMixin<TextToSignController>{

  final TextEditingController txtController = TextEditingController();

  final Rx<List<int>> bytes = Rx<List<int>>([]);

  TextToSignController({required this.signLanguageUseCases});

  SignLanguageUseCases signLanguageUseCases;

  @override
  void onInit() async {
    change(this, status: RxStatus.empty());
    super.onInit();
  }

  startRecognizingWithUi() async {
    if (await Permission.microphone.request().isGranted) {
      print(Permission.microphone.value);
      // txtController.text = await recognizer.startRecognizingWithUi(setting)??'';
    }
  }

  getSignVideo() async {
    try {
      change(this, status: RxStatus.loading());
      bytes.value = await signLanguageUseCases.getSignVideo(content: txtController.text);
      print(bytes.value);
      change(this, status: RxStatus.success());
    } catch (e){
      log(e.toString());
      bytes.value = [];
      change(this, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
