import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileController extends GetxController {
  final GoogleSignIn googleSignIn = Get.find<GoogleSignIn>();
  late final GoogleSignInAccount? currentUser;

  @override
  void onInit() async {
    currentUser = googleSignIn.currentUser;
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
