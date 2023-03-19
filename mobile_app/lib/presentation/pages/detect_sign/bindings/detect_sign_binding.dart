import 'package:get/get.dart';
import '../controllers/detect_sign_controller.dart';

class DetectSignBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DetectSignController>(
        DetectSignController(signLanguageUseCases: Get.find()));
  }
}
