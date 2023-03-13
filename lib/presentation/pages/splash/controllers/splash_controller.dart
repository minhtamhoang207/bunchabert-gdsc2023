import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:magic_sign/data/data_source/local/local_storage.dart';
import '../../../../config/routes/app_pages.dart';

class SplashController extends GetxController with StateMixin<SplashController>{

  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 1));
    String? token = await LocalStorage().getToken();
    bool isSignedInWithGoogle = await Get.find<GoogleSignIn>().isSignedIn();
    if(isSignedInWithGoogle) {
      await Get.find<GoogleSignIn>().signInSilently(
          suppressErrors: true, reAuthenticate: false
      );
    }
    if((token != null && token.isNotEmpty)
        || isSignedInWithGoogle){
      Get.offAllNamed(Routes.DASH_BOARD);
    } else {
      Get.offAllNamed(Routes.INTRO);
    }
    super.onInit();
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
