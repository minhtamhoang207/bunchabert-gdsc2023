import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magic_sign/data/models/news.dart';

import '../../../../domain/usecases/sign_language_usecase.dart';

class NewsDetailController extends GetxController {

  NewsDetailController({required this.signLanguageUseCases});

  SignLanguageUseCases signLanguageUseCases;

  final heroTag = Get.arguments['heroTag'];

  final Article? article = Get.arguments['article'];

  final TextEditingController txtController = TextEditingController();

  final Rx<List<int>> bytes = Rx<List<int>>([]);

  RxStatus getVideoStatus = RxStatus.empty();

  @override
  void onInit() {
    super.onInit();
  }

  getSignVideo() async {
    try {
      getVideoStatus = RxStatus.loading();
      BotToast.showLoading();
      bytes.value = await signLanguageUseCases.getSignVideo(content: txtController.text);
      print(bytes.value);
      BotToast.closeAllLoading();
      getVideoStatus = RxStatus.success();
    } catch (e){
      log(e.toString());
      bytes.value = [];
      BotToast.closeAllLoading();
      getVideoStatus = RxStatus.error('An error occurred');
  }}

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
