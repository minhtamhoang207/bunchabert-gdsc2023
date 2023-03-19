import 'dart:developer';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:magic_sign/core/helpers/exception.dart';
import 'package:magic_sign/core/utils/focus.dart';
import 'package:magic_sign/data/data_source/local/local_storage.dart';
import '../../../../data/models/user_sign_up.dart';
import '../../../../domain/usecases/auth_usecase.dart';
import '../../../../config/routes/app_pages.dart';

class LoginController extends GetxController {
  AuthUseCase authUseCase;
  LoginController({required this.authUseCase});

  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> login() async {
    try {
      if (userName.text.isNotEmpty && password.text.isNotEmpty) {
        AppFocus.unFocus();
        BotToast.showLoading();
        final response = await authUseCase.login(
            userAuth: UserAuth(
          username: userName.text,
          password: password.text,
        ));
        LocalStorage().saveToken(token: response.data['accessToken']);
        Get.offAllNamed(Routes.DASH_BOARD);
        BotToast.closeAllLoading();
      }
    } on ErrorEntity catch (e) {
      log(e.toString());
      BotToast.showText(text: e.message);
      BotToast.closeAllLoading();
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      await Get.find<GoogleSignIn>().signIn();
      if (await Get.find<GoogleSignIn>().isSignedIn()) {
        Get.offAllNamed(Routes.DASH_BOARD);
      }
    } catch (e) {
      BotToast.showText(text: e.toString());
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
