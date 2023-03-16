import 'dart:developer';

import 'package:get/get.dart';
import 'package:magic_sign/data/models/course.dart';

import '../../../../domain/usecases/course_usecase.dart';

class LearningController extends GetxController with StateMixin<LearningController> {

  LearningController({required this.courseUseCase});
  CourseUseCase courseUseCase;
  Rx<List<Course>> course = Rx<List<Course>>([]);

  final heroTag = Get.arguments;
  final count = 0.obs;
  @override
  void onInit() async {
    await getCourse();
    super.onInit();
  }

  getCourse() async {
    try {
      change(this, status: RxStatus.loading());
      course.value = await courseUseCase.getCourse();
      change(this, status: RxStatus.success());
    } catch (e){
      log(e.toString());
      change(this, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
