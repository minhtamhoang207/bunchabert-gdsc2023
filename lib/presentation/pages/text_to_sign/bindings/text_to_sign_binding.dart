import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../data/data_source/remote/sign_language_service.dart';
import '../../../../data/repositories/sign_language_repository_impl.dart';
import '../../../../domain/usecases/sign_language_usecase.dart';
import '../controllers/text_to_sign_controller.dart';

class TextToSignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TextToSignController>(
          () => TextToSignController(signLanguageUseCases: Get.find()),
    );
    Get.lazyPut(() => SignLanguageRepoImpl(signLanguageService: SignLanguageService(Get.find<Dio>())));
    Get.lazyPut(() => SignLanguageUseCases(signLanguageRepository: Get.find<SignLanguageRepoImpl>()));
  }
}
