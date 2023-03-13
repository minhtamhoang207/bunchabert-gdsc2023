import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:magic_sign/core/helpers/exception.dart';

import '../../../../data/models/user_sign_up.dart';
import '../../../../domain/usecases/auth_usecase.dart';
import '../../../../config/routes/app_pages.dart';

class SignUpController extends GetxController {

  AuthUseCase authUseCase;
  SignUpController({required this.authUseCase});

  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  register() async {
    try{
      if(email.text.isEmail && password.text == confirmPassword.text){
        BotToast.showLoading();
        await authUseCase.register(userAuth: UserAuth(
            username: userName.text,
            password: password.text,
            email: email.text
        ));
        BotToast.closeAllLoading();
        Get.offAllNamed(Routes.DASH_BOARD);
      }
    } on ErrorEntity catch (e){
      BotToast.showSimpleNotification(
        title: e.message,
        titleStyle: const TextStyle(
          color: Colors.white
        ),
        backgroundColor: Colors.red
      );
      BotToast.closeAllLoading();
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
