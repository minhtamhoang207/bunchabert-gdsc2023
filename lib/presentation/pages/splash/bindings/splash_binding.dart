import 'package:get/get.dart';
import 'package:magic_sign/domain/usecases/sample_usecases.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
