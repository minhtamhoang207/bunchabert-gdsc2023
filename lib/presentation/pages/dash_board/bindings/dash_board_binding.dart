import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:magic_sign/presentation/pages/profile/controllers/profile_controller.dart';
import '../../../../data/data_source/remote/course_service.dart';
import '../../../../data/data_source/remote/news_service.dart';
import '../../../../data/data_source/remote/sign_language_service.dart';
import '../../../../data/repositories/course_repository_impl.dart';
import '../../../../data/repositories/news_repository_impl.dart';
import '../../../../data/repositories/sign_language_repository_impl.dart';
import '../../../../domain/usecases/course_usecase.dart';
import '../../../../domain/usecases/news_usecase.dart';
import '../../../../domain/usecases/sign_language_usecase.dart';
import '../../detect_sign/controllers/detect_sign_controller.dart';
import '../../explore/controllers/explore_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../../learning/controllers/learning_controller.dart';
import '../controllers/dash_board_controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(
      () => DashBoardController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(newsUseCases: Get.find()),
    );
    Get.lazyPut<DetectSignController>(
      () => DetectSignController(signLanguageUseCases: Get.find()),
    );
    Get.lazyPut<ExploreController>(
      () => ExploreController(newsUseCases: Get.find()),
    );
    Get.lazyPut<LearningController>(
          () => LearningController(courseUseCase: Get.find()),
    );
    Get.lazyPut<ProfileController>(
          () => ProfileController(),
    );

    Get.lazyPut(() => NewsRepoImpl(newsService: NewsService(Get.find<Dio>())));
    Get.lazyPut(() => NewsUseCases(newsRepository: Get.find<NewsRepoImpl>()));
    Get.lazyPut(() => SignLanguageRepoImpl(signLanguageService: SignLanguageService(Get.find<Dio>())));
    Get.lazyPut(() => SignLanguageUseCases(signLanguageRepository: Get.find<SignLanguageRepoImpl>()));
    Get.lazyPut(() => CourseRepoImpl(courseService: CourseService(Get.find<Dio>())));
    Get.lazyPut(() => CourseUseCase(courseRepository: Get.find<CourseRepoImpl>()));
  }
}
