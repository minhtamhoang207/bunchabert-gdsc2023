import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:magic_sign/core/helpers/rest_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DependencyInjection {
  static Future<void> init() async {
    await Get.putAsync(() => SharedPreferences.getInstance());
    Get.put(RestClient().init());
    Get.put(GoogleSignIn());
  }
}
