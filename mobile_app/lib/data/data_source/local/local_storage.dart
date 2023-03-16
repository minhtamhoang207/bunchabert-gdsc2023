import 'package:get/get.dart';
import 'package:magic_sign/core/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final SharedPreferences sharedPreferences = Get.find();
  saveToken({required String token}) async {
    await sharedPreferences.setString(kBearerToken, token);
  }

  Future<String?> getToken() async {
    return sharedPreferences.getString(kBearerToken);
  }

  clearAll() async {
   await sharedPreferences.clear();
  }
}