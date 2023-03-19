import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../../data/data_source/remote/auth_service.dart';
import '../../../../data/repositories/auth_repository_impl.dart';
import '../../../../domain/usecases/auth_usecase.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(authUseCase: Get.find()),
    );
    Get.lazyPut(() => AuthRepoImpl(authService: AuthService(Get.find<Dio>())));
    Get.lazyPut(() => AuthUseCase(authRepository: Get.find<AuthRepoImpl>()));
  }
}
